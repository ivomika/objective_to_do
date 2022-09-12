import 'package:objective_to_do/Models/task_model.dart';

class HistoryModel{
  final int? id;
  final TaskModel task;
  final DateTime date;
  int change;
  int remains;

  HistoryModel({
    this.id,
    required this.task,
    required this.date,
    required this.change,
    required this.remains});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
      id: json["id"],
      task: json["task"],
      date: json["date"],
      change: json["change"],
      remains: json["remains"]
  );

  Map<String, dynamic> toJson() => {
    "task": task.id,
    "date": date.toString(),
    "change": change,
    "remains": remains
  };
}