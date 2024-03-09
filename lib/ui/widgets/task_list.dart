import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

class TaskList extends StatelessWidget {
  final List<Task> task;
  const TaskList({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: task.length,
        itemBuilder: (context, index) {
          return StaticTaskCard(
            task: task[index],
          );
        },
      ),
    );
  }
}
