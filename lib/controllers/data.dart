import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';

//lISTA INTERNA
class DataController {
  final List<Data> dailyData = [
    Data(
      name: "Lun",
      number: "11",
      id: 0,
      activities: [
        Activity(
            id: "1", name: "1. Actividad Lunes", containerColor: Colors.white)
      ],
      tasks: [
        Task(id: "1", name: "Tarea lunes", key: ValueKey(1)),
      ],
      completedTasks: [],
    ),
    Data(name: "Mar", number: "12", id: 1, activities: [], tasks: [
      Task(
        id: "1",
        name: "Tarea martes",
        key: ValueKey(1),
      ),
    ], completedTasks: []),
    Data(
      name: "Miér",
      number: "13",
      id: 2,
      activities: [],
      tasks: [],
      completedTasks: [],
    ),
    Data(
        name: "Jue",
        number: "14",
        id: 3,
        activities: [],
        tasks: [],
        completedTasks: []),
    Data(
        name: "Vier",
        number: "15",
        id: 4,
        activities: [],
        tasks: [],
        completedTasks: []),
    Data(
        name: "Sáb",
        number: "16",
        id: 5,
        activities: [],
        tasks: [],
        completedTasks: []),
    Data(
        name: "Dom",
        number: "17",
        id: 6,
        activities: [],
        tasks: [],
        completedTasks: [])
  ];

  //MÉTODO PARA GUARDAR Y REUTILIZAR EL INDEX, ES DECIR, EL DÍA

  int _index = 0;

  void setIndex(int index) {
    _index = index;
  }

  int getIndex() {
    return _index;
  }

//CRUD DE TAREAS
  //create
  int counter = 2;
  int keyCounter = 2;

  Task addTask(
    int index,
    String taskName,
  ) {
    final task = Task(
      id: counter.toString(),
      name: taskName,
      key: ValueKey(keyCounter),
    );

    dailyData[index].tasks.add(task);
    counter++;
    keyCounter++;

    return task;
  }

  //read
  List<Task> getAllTasks(int index) {
    return List<Task>.from(dailyData[index].tasks);
  }

  List<Task> getAllCompletedTasks(int index) {
    return List<Task>.from(dailyData[index].completedTasks);
  }

  //update
  Task updateTask(Task updatedTask, int index) {
    final internalIndex =
        dailyData[index].tasks.indexWhere((task) => task.id == updatedTask.id);
    if (internalIndex != -1) {
      dailyData[index].tasks[internalIndex] = updatedTask;
      return updatedTask;
    } else {
      throw Exception('Tarea no encontrada');
    }
  }

  Future<Task> completeTask(int index, Task task, String taskId) async {
    dailyData[index].completedTasks.add(task);
    dailyData[index].tasks.removeWhere((task) => task.id == taskId);

    return task;
  }

  Future<Task> deCompleteTask(int index, Task task, String taskId) async {
    dailyData[index].tasks.add(task);
    dailyData[index].completedTasks.removeWhere((task) => task.id == taskId);

    return task;
  }

  //delete
  void deleteTask(int index, String taskId) {
    dailyData[index].tasks.removeWhere((task) => task.id == taskId);
  }

//CRUD DE ACTIVIDADES
  //create
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

  //read
  List<Activity> getAllActivities(int index) {
    return List<Activity>.from(dailyData[index].activities);
  }

  //update
  Activity updateActivity(
    int index,
    Activity updatedActivity,
  ) {
    final internalIndex = dailyData[index]
        .activities
        .indexWhere((activity) => activity.id == updatedActivity.id);
    if (internalIndex != -1) {
      dailyData[index].activities[internalIndex] = updatedActivity;
      return updatedActivity;
    } else {
      throw Exception('Tarea no encontrada');
    }
  }

  //delete
  void deleteActivity(int index, String activityId) {
    dailyData[index]
        .activities
        .removeWhere((activity) => activity.id == activityId);
  }

//TRAER TODA LA DATA
  List<Data> getAllData() {
    return dailyData;
  }
}
