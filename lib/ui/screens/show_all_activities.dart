import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/dialogs/dialogs.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:provider/provider.dart';

class ShowAllActivitiesScreen extends StatelessWidget {
  const ShowAllActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activityService = Provider.of<ActivityService>(context);
    final List<Activity> activities = activityService.getAllActivities();

    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 229, 229),
          border: Border.all(color: Colors.black, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 0.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, top: 50),
                child: Row(
                  children: [
                    CustomIconButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leftMargin: 0,
                        topMargin: 0,
                        width: 40,
                        height: 40,
                        color: "6BB0A8",
                        image: "assets/icon_goback.png"),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Mis actividades",
                      style: TextStyles.h2,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ActivityList(activities: activities),
              ),
              const DialogButton(dialog: CreateActivityDialog()),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
