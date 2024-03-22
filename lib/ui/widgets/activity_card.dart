import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';

import 'package:habit_tracker_daily_tasker/ui/dialogs/dialogs.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/custom_circle_button.dart';

import 'package:ionicons/ionicons.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    final time = activity.time ?? "00:00:00";
    final Color color = activity.containerColor;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.activityScreen,
          arguments: activity,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(4),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 0.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 130,
                child: Text(
                  activity.name,
                  style: TextStyles.p,
                ),
              ),
              const Spacer(),
              Text(
                time,
                style: TextStyles.p,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomCircleButton(
                  width: 30,
                  height: 30,
                  content: const Icon(Ionicons.trash, size: 20),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => DeleteActivityDialog(
                              activity: activity,
                              toHome: false,
                            ));
                  }),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
