import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double leftMargin;
  final double topMargin;
  final double rightMargin;
  final double bottomMargin;
  final double width;
  final double height;
  final String color;
  final String image;
  final VoidCallback? onTap;
  const CustomIconButton({
    Key? key,
    this.leftMargin = 0,
    this.topMargin = 0,
    required this.width,
    required this.height,
    required this.color,
    required this.image,
    this.onTap,
    this.rightMargin = 0,
    this.bottomMargin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(
            leftMargin, topMargin, rightMargin, bottomMargin),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(4),
          color: Color(int.parse("0xff$color")),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 0.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Image.asset(image),
      ),
    );
  }
}
