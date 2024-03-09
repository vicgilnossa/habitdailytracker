import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? color;
  final Widget? content;

  final VoidCallback onPressed;

  const CustomCircleButton(
      {Key? key,
      required this.onPressed,
      this.width = 30,
      this.height = 30,
      this.content,
      this.color = "FFFFFF"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(int.parse("0xff$color")),
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: content),
    );
  }
}
