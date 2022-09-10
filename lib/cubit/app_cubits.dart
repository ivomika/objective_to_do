import 'package:bloc/bloc.dart';
import 'package:objective_to_do/Models/history_model.dart';
import 'package:objective_to_do/Models/task_model.dart';

import '../services/data_services.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    // emit(LoadingState());
    getTasks();
  }

  final DataService data;

  void getTasks() async {
    try {
      emit(LoadingState());
      final taskList = await data.getTasks();
      emit(TasksState(taskList));
    } catch (e) {
      print(e);
    }
  }

  void getHistory(TaskModel task) async {
    emit(LoadingState());
    final history = await data.getHistory(task.id);
    emit(HistoryState(history));
  }

  void addTask(TaskModel task) async {
    final tasks = await data.addTask(task);
    emit(LoadingState());
    emit(TasksState(tasks));
  }

  void addHistory(HistoryModel story) async {
    await data.addHistory(story);
  }

  Future<List<TaskModel>> tasks() async {
    return await data.getTasks();
  }

  void deleteTask(TaskModel task) async {
    var tasks = await data.deleteTask(task);

    emit(LoadingState());
    emit(TasksState(tasks));
  }

  Future<TaskModel> decrementTaskCount(TaskModel task, int value) async {
    emit(LoadingState());

    var decrementedTask = await data.decrementTaskCount(task, value);

    emit(TasksState(await tasks()));

    return decrementedTask;
  }
}
