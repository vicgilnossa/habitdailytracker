import 'package:habit_tracker_daily_tasker/models/models.dart';

class Data {
  final String name;
  final String number;
  final int id;
  final List<Activity> activities;
  final List<Task> tasks;
  final List<Task> completedTasks;

  Data(
      {required this.name,
      required this.number,
      required this.id,
      required this.activities,
      required this.tasks,
      required this.completedTasks});
}
