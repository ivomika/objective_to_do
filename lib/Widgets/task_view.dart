import 'package:flutter/cupertino.dart';
import 'package:objective_to_do/Models/task_model.dart';

import '../Assets/app_theme.dart';

class TaskView extends StatelessWidget {
  final TaskModel task;
  final double? fontSize;
  final MainAxisAlignment? alignment;

  const TaskView({
    Key? key,
    required this.task,
    this.fontSize = 52,
    this.alignment = MainAxisAlignment.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: alignment!,
        children: [
          Text(
            '${task.count}',
            style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              task.type,
              style: TextStyle(
                  fontSize: (fontSize!/2),
                  color: AppTheme.secondaryGray),
            ),
          )
        ]);
  }
}
