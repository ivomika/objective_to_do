import 'package:objective_to_do/Extension/date_only_compare.dart';
import 'package:objective_to_do/Models/history_model.dart';
import 'package:objective_to_do/Models/task_model.dart';
import '../Data/data.dart';


class DataService{
  Future<List<TaskModel>> getTasks() async{
    try{
      return tasks;
    }catch(e){
      print(e);
      return <TaskModel>[];
    }
  }

  Future<List<HistoryModel>> getHistory(int id) async{
    try{
      List<HistoryModel> taskHistory = [];

      for(var story in history){
        if(story.task.id == id) {
          taskHistory.add(story);
        }
      }

      return taskHistory;
    }catch(e){
      print(e);
      return history;
    }
  }

  Future<List<TaskModel>> addTask(TaskModel task) async{
    try{
      tasks.add(task);

      return tasks;
    }catch(e){
      print(e);
      return tasks;
    }
  }

  Future addHistory(HistoryModel story) async{
    try{
      history.add(story);
    }catch(e){
      print(e);
    }
  }

  Future<TaskModel> decrementTaskCount(TaskModel task, int value) async{
    if(value > task.count){
      return throw Exception("The change exceeds the task count");
    }

    var story = history.firstWhere((element) =>
    element.task.id == task.id &&
    element.date.isSameDate(DateTime.now()),
        orElse: () {
          return HistoryModel(task, DateTime.now(), 0, task.count);
        });

    story.change += value;
    story.remains -= value;
    if(!history.contains(story)) {
        history.add(story);
      }

    task.count -= value;

    return task;
  }

  Future<List<TaskModel>> deleteTask(TaskModel task) async{
    for(int i = 0; i < history.length; i++){
      if(history[i].task == task)
        {
          history.remove(history[i]);
        }
    }

    tasks.remove(task);
    return tasks;
  }
}