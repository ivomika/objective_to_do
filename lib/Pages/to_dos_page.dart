import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objective_to_do/Models/task_model.dart';
import 'package:objective_to_do/Widgets/task.dart';
import 'package:objective_to_do/Widgets/todo_form.dart';
import 'package:objective_to_do/Data/data.dart' as data;
import '../Assets/app_theme.dart';
import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';

class ToDosPage extends StatefulWidget {
  const ToDosPage({Key? key}) : super(key: key);

  @override
  State<ToDosPage> createState() => _ToDosPageState();
}

class _ToDosPageState extends State<ToDosPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (BuildContext context, state) {
        var tasks = (state as TasksState).tasks;

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
      },
    );
  }
}
