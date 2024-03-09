import 'package:flutter/material.dart' hide ReorderableList;

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

import 'package:lottie/lottie.dart';

class AnimationTestScreen extends StatelessWidget {
  const AnimationTestScreen({Key? key}) : super(key: key);

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
              LottieBuilder.network(
                  "https://lottie.host/92ce2f3a-1a4b-4387-ba29-56a5bee18f62/D4TiY5Q4Fv.json"),
            ]),
          ),
        ),
      ),
    );
  }
}
