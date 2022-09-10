import 'package:flutter/material.dart';

import '../Assets/app_theme.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController? textEditingController;

  const StyledTextField({
    Key? key,
    this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: textEditingController!,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
                width: 3, color: AppTheme.primaryAccent
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
                width: 3, color: AppTheme.secondaryGray
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
                width: 3, color: AppTheme.primaryError
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
                width: 3, color: AppTheme.primaryError
            )
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(20),
        hintText: 'Enter your ToDo',
        hintStyle: TextStyle(
            color: AppTheme.textPrimary.withOpacity(.4)
        ),
      ),
      style: const TextStyle(
          color: AppTheme.textPrimary
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter some text';
        }
        if (value.trim().split(' ').length != 2){
          return 'Please enter task required format: 228 apple';
        }
        var splitValue = value.trim().split(' ');
        if (int.tryParse(splitValue[0]) == null){
          return 'Please enter required COUNT: 0-9';
        }

        return null;
      },
    );
  }
}

