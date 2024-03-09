import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final String color;
  final Future<void> Function() function;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 3),
                blurRadius: 0.8,
                spreadRadius: 0,
              ),
            ],
            color: Color(int.parse("0xff$color")),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          text,
          style: TextStyles.h3,
        )),
      ),
    );
  }
}
