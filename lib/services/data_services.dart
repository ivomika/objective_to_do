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
}