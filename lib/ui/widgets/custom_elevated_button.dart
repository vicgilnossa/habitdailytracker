import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

import '../../models/models.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.activity,
    required this.text,
    this.function,
  });

  final Activity activity;
  final String text;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(2),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 255, 245, 109)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.black, // Color del borde
              width: 1, // Ancho del borde en píxeles
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.h3,
          ),
        ));
  }
}