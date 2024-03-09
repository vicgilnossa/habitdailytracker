import 'package:flutter/material.dart';

class SimpleBackground extends StatelessWidget {
  final Widget child;

  const SimpleBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffff6ddab),
        ),
        Image.asset(
          'assets/welcome_bg0.png',
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
