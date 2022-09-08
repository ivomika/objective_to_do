import 'package:flutter/material.dart';
import 'package:objective_to_do/Assets/app_theme.dart';
import 'package:objective_to_do/Pages/to_dos_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: AppTheme.primary,
      errorColor: AppTheme.primaryError,
      selectedRowColor: AppTheme.primaryAccent,
      focusColor: AppTheme.primaryAccent,
      backgroundColor: AppTheme.primary
    ),
    home: ToDosPage(),
  ));
}