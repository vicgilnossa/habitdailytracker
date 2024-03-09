import 'package:flutter/material.dart' hide ReorderableList;

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

import 'package:lottie/lottie.dart';

class WelcomeSplashScreen extends StatelessWidget {
  const WelcomeSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 106, 104),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "¿Listo para empezar?",
                    style: TextStyles.h1,
                    textAlign: TextAlign.center,
                  ),
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
