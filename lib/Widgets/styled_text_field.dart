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
        contentPadding: EdgeInsets.all(20),
        hintText: 'Enter your ToDo',
        hintStyle: TextStyle(
            color: AppTheme.textPrimary.withOpacity(.4)
        ),
      ),
      style: const TextStyle(
          color: AppTheme.textPrimary
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

