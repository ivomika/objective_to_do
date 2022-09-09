import 'package:objective_to_do/Models/history_model.dart';

import '../Models/task_model.dart';

var tasks = [
  TaskModel(1, 1, 'km.'),
  TaskModel(2, 228, 'dec.'),
  TaskModel(3, 448, 'dec.')
];

var history = [
  HistoryModel(tasks[0], DateTime(2022, 12, 13), 5, 200),
  HistoryModel(tasks[1], DateTime(2022, 12, 13), 6, 300),
  HistoryModel(tasks[2], DateTime(2022, 12, 13), 7, 400),
  HistoryModel(tasks[2], DateTime(2022, 12, 14), 8, 392),
];