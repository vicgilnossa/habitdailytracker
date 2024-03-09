import 'package:habit_tracker_daily_tasker/models/models.dart';

class DailyData {
  final String name;
  final String number;
  final List<Activity> activities;
  final List<Task> tasks;
  final List<Task> completedTasks;

  DailyData(
      {required this.name,
      required this.number,
      required this.activities,
      required this.tasks,
      required this.completedTasks});
}

final List<DailyData> dailyData = [
  DailyData(
      name: "Lunes",
      number: "11",
      activities: [],
      tasks: [],
      completedTasks: []),
  DailyData(
      name: "Martes",
      number: "12",
      activities: [],
      tasks: [],
      completedTasks: []),
  DailyData(
      name: "Miércoles",
      number: "13",
      activities: [],
      tasks: [],
      completedTasks: []),
  DailyData(
      name: "Jueves",
      number: "14",
      activities: [],
      tasks: [],
      completedTasks: []),
  DailyData(
      name: "Viernes",
      number: "15",
      activities: [],
      tasks: [],
      completedTasks: []),
  DailyData(
      name: "Sábado",
      number: "16",
      activities: [],
      tasks: [],
      completedTasks: []),
  DailyData(
      name: "Domingo",
      number: "17",
      activities: [],
      tasks: [],
      completedTasks: [])
];
