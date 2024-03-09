import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double leftMargin;
  final double topMargin;
  final double width;
  final double height;
  final String color;
  final String image;
  final VoidCallback? onTap;
  const CustomIconButton({
    Key? key,
    this.leftMargin = 30,
    this.topMargin = 60,
    required this.width,
    required this.height,
    required this.color,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, top: topMargin),
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
