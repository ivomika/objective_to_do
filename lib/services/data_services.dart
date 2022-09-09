import 'dart:convert';

import 'package:objective_to_do/Models/history_model.dart';
import 'package:objective_to_do/Models/task_model.dart';
import 'package:objective_to_do/cubit/app_cubit_states.dart';

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

  Future<HistoryModel> getHistory(int id) async{
    try{
      for(var story in history){
        if(story.task.id == id) {
          return story;
        }
      }

      return history[0];
    }catch(e){
      print(e);
      return history[0];
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
}