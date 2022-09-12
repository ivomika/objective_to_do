import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objective_to_do/Assets/app_theme.dart';
import 'package:objective_to_do/Pages/history_page.dart';
import 'package:objective_to_do/Pages/to_dos_page.dart';

import 'app_cubit_states.dart';
import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is LoadingState){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: AppTheme.primary ,
              child: Center(
                child: CircularProgressIndicator(),
              ));
          }
          if(state is TasksState){
            return const ToDosPage();
          }
          if(state is HistoryState){
            return const HistoryPage();
          }
          else{
            return const Center(
              child: Text('404'),
            );
          }
        }
      ),
    );
  }
}
