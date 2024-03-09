import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    super.key,
    required this.activities,
  });

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ActivityCard(activity: activities[index]);
      },
    );
  }
}