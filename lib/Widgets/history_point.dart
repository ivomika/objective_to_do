import 'package:flutter/cupertino.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:objective_to_do/Models/history_model.dart';

import '../Assets/app_theme.dart';

class HistoryPoint extends StatelessWidget {
  final HistoryModel history;

  const HistoryPoint({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = history.date;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Dash(
              length: 50,
              dashColor: AppTheme.textPrimary,
              dashThickness: 2,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  '${date.day}.${date.month}.${date.year}',
                  style: const TextStyle(
                      fontSize: 12, color: AppTheme.textPrimary),
                )),
            const Dash(
              length: 50,
              dashColor: AppTheme.textPrimary,
              dashThickness: 2,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Выполнено ${history.change} '
            '${history.task.type}, '
            'осталось  ${history.remains} '
            '${history.task.type}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.textPrimary,
            ),
          ),
        )
      ],
    );
  }
}
