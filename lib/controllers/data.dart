import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

class DataController {
  final List<Data> dailyData = [
    Data(
      name: "Lun",
      number: "11",
      id: 1,
      activities: [],
      tasks: [
        Task(id: "1", name: "Tarea lunes", key: ValueKey(1)),
      ],
      completedTasks: [],
    ),
    Data(name: "Mar", number: "12", id: 2, activities: [], tasks: [
      Task(
        id: "1",
        name: "Tarea martes",
        key: ValueKey(1),
      ),
      Task(id: "2", name: "Segunda del martes", key: ValueKey(2))
    ], completedTasks: []),
    Data(
      name: "Miér",
      number: "13",
      id: 3,
      activities: [],
      tasks: [],
      completedTasks: [],
    ),
    Data(
        name: "Jue",
        number: "14",
        id: 4,
        activities: [],
        tasks: [],
        completedTasks: []),
    Data(
        name: "Vier",
        number: "15",
        id: 5,
        activities: [],
        tasks: [],
        completedTasks: []),
    Data(
        name: "Sáb",
        number: "16",
        id: 6,
        activities: [],
        tasks: [],
        completedTasks: []),
    Data(
        name: "Dom",
        number: "17",
        id: 7,
        activities: [],
        tasks: [],
        completedTasks: [])
  ];

  //Variables para determinar el día
  String _selectedDay = "Lun";

  void setSelectedDay(String day) {
    _selectedDay = day;
  }

  String getSelectedDay() {
    return _selectedDay;
  }

  int _index = 1;

  void setIndex(int index) {
    _index = index;
  }

  int getIndex() {
    return _index;
  }

  // Métodos para añadir datos

  Task addTask(
    int index,
    String taskName,
  ) {
    int counter = 1;
    final task = Task(
      id: counter.toString(),
      name: taskName,
      key: ValueKey(counter),
    );

    dailyData[index].tasks.add(task);
    counter++;

    return task;
  }

  Activity addActivity(
    int index,
    String activityName,
    Color containerColor,
  ) {
    int counter = 1;
    final activity = Activity(
        id: counter.toString(),
        name: activityName,
        containerColor: containerColor);

    dailyData[index].activities.add(activity);
    counter++;

    return activity;
  }

  List<Data> getData() {
    return List<Data>.from(dailyData);
  }

  List<Task> getAllTasks(String day) {
    switch (day) {
      case "Lun":
        return List<Task>.from(dailyData[0].tasks);
      case "Mar":
        return List<Task>.from(dailyData[1].tasks);
      case "Miér":
        return List<Task>.from(dailyData[2].tasks);
      case "Jue":
        return List<Task>.from(dailyData[3].tasks);
      case "Vier":
        return List<Task>.from(dailyData[4].tasks);
      case "Sáb":
        return List<Task>.from(dailyData[5].tasks);
      case "Dom":
        return List<Task>.from(dailyData[6].tasks);
      default:
        throw Exception("Día no válido: $day");
    }
  }

  List<Task> getAllActivities(String day) {
    switch (day) {
      case "Lunes":
        return List<Task>.from(dailyData[0].activities);
      case "Martes":
        return List<Task>.from(dailyData[1].activities);
      case "Miércoles":
        return List<Task>.from(dailyData[2].activities);
      case "Jueves":
        return List<Task>.from(dailyData[3].activities);
      case "Viernes":
        return List<Task>.from(dailyData[4].activities);
      case "Sábado":
        return List<Task>.from(dailyData[5].activities);
      case "Domingo":
        return List<Task>.from(dailyData[6].activities);
      default:
        throw Exception("Día no válido: $day");
    }
  }

  Future<Task> completeTask(Task task, String taskId, int index) async {
    dailyData[index].completedTasks.add(task);
    dailyData[index].tasks.removeWhere((task) => task.id == taskId);

    return task;
  }
}
