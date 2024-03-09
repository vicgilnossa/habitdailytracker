import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

class CompletedTaskList extends StatelessWidget {
  final List<Task> task;
  const CompletedTaskList({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Completadas",
            style: TextStyles.h3,
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: task.length,
            itemBuilder: (context, index) {
              return CompletedTaskCard(
                task: task[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
