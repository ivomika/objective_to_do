import 'package:equatable/equatable.dart';
import 'package:objective_to_do/Models/history_model.dart';
import 'package:objective_to_do/Models/task_model.dart';


abstract class CubitStates extends Equatable{}

class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class TasksState extends CubitStates{
  TasksState(this.tasks);
  final List<TaskModel> tasks;

  @override
  // TODO: implement props
  List<Object> get props => [tasks];

}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class HistoryState extends CubitStates{
  HistoryState(this.history);
  final HistoryModel history;

  @override
  // TODO: implement props
  List<Object> get props => [history];

}
