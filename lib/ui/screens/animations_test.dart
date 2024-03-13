import 'package:flutter/material.dart' hide ReorderableList;

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class Tareas {
  final String name;

  Tareas({required this.name});
}

class AnimationTestScreen extends StatefulWidget {
  const AnimationTestScreen({Key? key}) : super(key: key);

  @override
  State<AnimationTestScreen> createState() => _AnimationTestScreenState();
}

class _AnimationTestScreenState extends State<AnimationTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff6ddab),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Pantalla de pruebas",
                  style: TextStyles.h1,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
