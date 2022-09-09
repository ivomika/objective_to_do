import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objective_to_do/Models/task_model.dart';
import 'package:objective_to_do/Widgets/task_view.dart';
import 'package:objective_to_do/cubit/app_cubits.dart';

import '../Assets/app_theme.dart';

class Task extends StatelessWidget {
  final TaskModel task;
  const Task({
    required this.task,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 15
      ),
      child: SizedBox(
          width: double.maxFinite,
          height: 65,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppTheme.secondary
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  topRight: Radius.circular(25)
                              ),
                            )
                        )
                    ),
                    onPressed: (){},
                    child: const Text(
                      '-',
                      style: TextStyle(
                          fontSize: 50,
                          color: AppTheme.textPrimary
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30)
              ),
              Flexible(
                  flex: 3,

                  child: Dismissible(
                    key: ValueKey<int>(task.id),
                    direction: DismissDirection.startToEnd,

                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,

                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppTheme.secondary
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25)
                                  ),
                                )
                            )
                        ),
                        onPressed: (){
                          BlocProvider.of<AppCubits>(context).getHistory(task);
                        },

                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20
                          ),
                          child: TaskView(task: task,
                          fontSize: 32,
                          alignment: MainAxisAlignment.start)
                        ),
                      ),
                    ),
                  )
              ),
            ],
          )),
    );
  }
}
