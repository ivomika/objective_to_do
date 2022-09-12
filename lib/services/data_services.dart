import 'dart:io';
import 'dart:ui';

import 'package:objective_to_do/Extension/date_only_compare.dart';
import 'package:objective_to_do/Models/history_model.dart';
import 'package:objective_to_do/Models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Data/data.dart';


class DataService{
  static final DataService dataService = DataService();
  Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path , "TestDB.db");

    return await openDatabase(path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE TASKS ("
              "id INTEGER UNIQUE PRIMARY KEY,"
              "type TEXT,"
              "startCount INTEGER,"
              "count INTEGER"
              ");");
          await db.execute("CREATE TABLE HISTORY ("
              "id INTEGER UNIQUE PRIMARY KEY,"
              "task INTEGER NOT NULL,"
              "date TEXT,"
              "change INTEGER,"
              "remains INTEGER,"
              "FOREIGN KEY(task) REFERENCES TASKS(id)"
              ");");
        });
  }

  Future<List<TaskModel>> getTasks() async{
    try{
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('TASKS');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return TaskModel.fromJson(maps[i]);
      });
    }catch(e){
      print(e);
      return <TaskModel>[];
    }
  }

  Future<List<HistoryModel>> getHistory(int taskId) async{
    try{
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('HISTORY',
        where: 'task = ?',
        whereArgs: [taskId]
      );

      var tasks = await getTasks();

      return List.generate(maps.length, (i) {
        var story = HistoryModel(
            id: maps[i]['id'],
            task: tasks.firstWhere((element) => element.id == maps[i]['task']),
            date: DateTime.parse(maps[i]['date']),
            change: maps[i]['change'],
            remains: maps[i]['remains']);
        return story;
      });
    }catch(e){
      print(e);
      return history;
    }
  }

  Future<TaskModel?> getTask(int id) async{
    try{
      final db = await database;
      var res = await  db.query("TASKS", where: "id = ?", whereArgs: [id]);
      return res.isNotEmpty ? TaskModel.fromJson(res.first) : null ;
    }catch(e){
      print(e);
      return tasks.first;
    }
  }

  Future<List<TaskModel>> addTask(TaskModel task) async{
    try{
      final db = await database;

      var taskId = await db.rawInsert(
          "INSERT Into TASKS (type, startCount, count)"
              " VALUES ('${task.type}',${task.startCount}, ${task.count})");

      var newTask = await getTask(taskId);

      await addHistory(
          HistoryModel(
              task: newTask!,
              date:DateTime.now(),
              change: 0,
              remains: newTask.count
          )
      );


      return getTasks();
    }catch(e){
      print(e);
      return tasks;
    }
  }

  Future addHistory(HistoryModel story) async{
    try{
      final db = await database;

      await db.rawInsert(
          "INSERT Into HISTORY (task, date, change, remains)"
              " VALUES (${story.task.id},'${story.date}', ${story.change}, ${story.remains})");
    }catch(e){
      print(e);
    }
  }

  Future<TaskModel> decrementTaskCount(TaskModel task, int value) async{
    if(value > task.count){
      return throw Exception("The change exceeds the task count");
    }

    // Get a reference to the database.
    final db = await database;
    var history = await getHistory(task.id!);
    var story = history.firstWhere((element) =>
    element.date.isSameDate(DateTime.now()),
        orElse: () {
          return HistoryModel(task: task, date: DateTime.now(), change: 0, remains: task.count);
        });

    story.change += value;
    story.remains -= value;
    if(!history.contains(story)) {
        await addHistory(story);
      }

    await db.update(
      'HISTORY',
      story.toJson(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [story.id],
    );


    task.count -= value;

    await db.update(
      'TASKS',
      task.toJson(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );

    return task;
  }

  Future<List<TaskModel>> deleteTask(TaskModel task) async{
    final db = await database;

    // for(int i = 0; i < history.length; i++){
    //   if(history[i].task == task)
    //     {
    //       await db.delete(
    //         'HISTORY',
    //         where: 'id = ?',
    //         whereArgs: [history[i].id],
    //       );
    //     }
    // }

    await db.delete(
      'TASKS',
      where: 'id = ?',
      whereArgs: [task.id],
    );

    return getTasks();
  }
}