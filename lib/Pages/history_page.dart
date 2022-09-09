import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objective_to_do/Assets/app_theme.dart';
import 'package:objective_to_do/Widgets/history_point.dart';
import 'package:objective_to_do/Widgets/task_view.dart';
import 'package:objective_to_do/cubit/app_cubit_states.dart';

import '../cubit/app_cubits.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (BuildContext context, state) {
        var history = (state as HistoryState).history;

        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            backgroundColor: AppTheme.primary,

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<AppCubits>(context).getTasks();
              },
              backgroundColor: AppTheme.primary,
              child: const Icon(Icons.arrow_back, color: AppTheme.textPrimary),
            ),

            body: SafeArea(
              child: Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Center(
                        child: TaskView(task: history.last.task,)
                      )),
                  Flexible(
                      flex: 4,
                      child: ListView.builder(
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            return HistoryPoint(history: history[index]);
                          }))
                ],
              ),
            ));
      },
    );
  }
}
