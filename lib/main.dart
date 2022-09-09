import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objective_to_do/Assets/app_theme.dart';
import 'package:objective_to_do/Pages/to_dos_page.dart';
import 'package:objective_to_do/services/data_services.dart';

import 'cubit/app_cubit_logics.dart';
import 'cubit/app_cubits.dart';

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
    home: BlocProvider<AppCubits>(
      create: (context)=>AppCubits(
          data: DataService()
      ),
      child: const AppCubitLogics(),
      )
    )
  );
}
