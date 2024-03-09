import 'package:flutter/material.dart';

class SquaredBackground extends StatelessWidget {
  final Widget child;
  final String color;

  const SquaredBackground({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(int.parse("0xff$color")),
        ),
        Image.asset(
          'assets/welcome_bg.png',
          fit: BoxFit.cover,
        ),
        Image.asset('assets/welcome_bg0.png', fit: BoxFit.cover),
        child,
      ],
    );
  }
}

//Color.fromARGB(255, 255, 173, 8)
//Color(0xffff6ddab)