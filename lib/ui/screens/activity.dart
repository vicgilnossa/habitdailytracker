import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(195, 141, 152, 255),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 180,
                  height: 180,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
              Text(
                "Gym",
                style: TextStyles.h1,
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    "Repetir",
                    style: TextStyles.h1,
                  ),
                  Spacer(),
                  Text(
                    "Semanalmente",
                    style: TextStyles.p,
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ));
  }
}
