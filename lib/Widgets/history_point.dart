import 'package:flutter/cupertino.dart';
import 'package:flutter_dash/flutter_dash.dart';
import '../Assets/app_theme.dart';

class HistoryPoint extends StatelessWidget {
  final String title;
  final String text;

  const HistoryPoint({
    Key? key,
    required this.title,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  title,
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
            text,
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
