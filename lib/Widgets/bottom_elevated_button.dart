import 'package:flutter/material.dart';

import '../Assets/app_theme.dart';

class BottomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final Function()? onLongPress;
  const BottomElevatedButton({
    Key? key,
    required this.onPressed,
    this.onLongPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        onPressed();
      },
      onLongPress: (){
        onLongPress!();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              AppTheme.primaryAccent
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                ),
              )
          )
      ),
      child: const Text('Submit', style: TextStyle(
        fontSize: 24,
        color: AppTheme.textPrimary,
      ),),
    );
  }
}
