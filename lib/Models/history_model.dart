import 'package:objective_to_do/Models/task_model.dart';

class HistoryModel{
  final TaskModel task;
  final DateTime date;
  int change;
  int remains;

  HistoryModel(this.task, this.date, this.change, this.remains);
}