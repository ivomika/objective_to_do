import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objective_to_do/Models/history_model.dart';
import 'package:objective_to_do/Models/task_model.dart';
import 'package:objective_to_do/Widgets/bottom_elevated_button.dart';
import 'package:objective_to_do/Widgets/styled_text_field.dart';

import '../cubit/app_cubits.dart';

class ToDoForm extends StatefulWidget {
  const ToDoForm({Key? key}) : super(key: key);

  @override
  State<ToDoForm> createState() => _ToDoFormState();
}

class _ToDoFormState extends State<ToDoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController todoEditingController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: StyledTextField(
              textEditingController: todoEditingController,
            )
          ),
          SizedBox(
            height: 65,
            width: double.maxFinite,
            child: BottomElevatedButton(
              onPressed: () async{
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  var value = todoEditingController.text;
                  var splitValue = value.split(' ');

                  var provider = BlocProvider.of<AppCubits>(context);
                  var tasks = await provider.tasks();
                  var count = int.parse(splitValue[0]);
                  var newTask = TaskModel(tasks.length+1, count, splitValue[1], count);

                  provider.addTask(newTask);
                  provider.addHistory(HistoryModel(newTask, DateTime.now(), 0, newTask.count));

                  _formKey.currentState?.reset();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
