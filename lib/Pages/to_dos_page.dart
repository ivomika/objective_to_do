import 'package:flutter/material.dart';
import 'package:objective_to_do/Models/task_model.dart';
import 'package:objective_to_do/Widgets/task.dart';
import 'package:objective_to_do/Widgets/todo_form.dart';

import '../Assets/app_theme.dart';

class ToDosPage extends StatefulWidget {
  const ToDosPage({Key? key}) : super(key: key);

  @override
  State<ToDosPage> createState() => _ToDosPageState();
}

class _ToDosPageState extends State<ToDosPage> {
  var tasks = [
    TaskModel(1, 1, 'km.'),
    TaskModel(2, 228, 'dec.'),
    TaskModel(3, 448, 'dec.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                flex: 4,
                child: ListView.builder(
                  itemCount: tasks.length,

                   itemBuilder: (BuildContext context, int index) {
                    return Task(task: tasks[index]);
                },
                )),
            const ToDoForm()
      ],
    )));
  }
}
