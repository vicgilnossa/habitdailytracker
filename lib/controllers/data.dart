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
            id: "1", name: "1. Actividad Lunes", containerColor: Colors.white),
      ],
      tasks: [
        Task(
          id: "1",
          name: "Tarea lunes: uno",
        ),
        Task(
          id: "2",
          name: "Tarea lunes: dos",
        ),
        Task(
          id: "3",
          name: "Tarea lunes: tres",
        ),
        Task(
          id: "4",
          name: "Tarea lunes: cuatro",
        ),
      ],
      completedTasks: [Task(id: "12", name: "Yo que se")],
    ),
    Data(name: "Mar", number: "12", id: 1, activities: [
      Activity(
          id: "1",
          name: "1. Actividad martes",
          containerColor: const Color.fromARGB(255, 211, 46, 46)),
    ], tasks: [
      Task(
        id: "1",
        name: "Tarea martes: uno",
      ),
      Task(
        id: "2",
        name: "Tarea martes: dos",
      ),
      Task(
        id: "3",
        name: "Tarea martes: tres",
      ),
      Task(
        id: "4",
        name: "Tarea martes: cuatro",
      ),
    ], completedTasks: [
      Task(id: "13", name: "Yo si se")
    ]),
    Data(
      name: "Miér",
      number: "13",
      id: 2,
      activities: [
        Activity(
            id: "1",
            name: "1. Actividad Miércoles",
            containerColor: Color.fromARGB(255, 243, 255, 68)),
      ],
      tasks: [],
      completedTasks: [],
    ),
    Data(name: "Jue", number: "14", id: 3, activities: [
      Activity(
          id: "1",
          name: "1. Actividad Jueves",
          containerColor: Color.fromARGB(255, 104, 114, 255)),
    ], tasks: [], completedTasks: []),
    Data(name: "Vier", number: "15", id: 4, activities: [
      Activity(
          id: "1",
          name: "1. Actividad viernes",
          containerColor: Color.fromARGB(255, 255, 61, 197)),
    ], tasks: [], completedTasks: []),
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

//VARIABLES REUTILIZABLES
  //Determinar el día
  int _index = 0;

  void setIndex(int index) {
    _index = index;
  }

  int getIndex() {
    return _index;
  }

  //Tamaños de la lista
  int _newLength = 1;

  void setNewLength(int newLength) {
    _newLength = newLength;
  }

  int getNewLength() {
    return _newLength;
  }

  int _oldLength = 1;

  void setOldLength(int oldLength) {
    _oldLength = oldLength;
  }

  int getOldLength() {
    return _oldLength;
  }

//CRUD DE TAREAS
  //create
  int taskCounter = 2;
  Task addTask(
    int index,
    String taskName,
  ) {
    final task = Task(
      id: taskCounter.toString(),
      name: taskName,
    );
    final oldLength = dailyData[index].tasks.length;
    setOldLength(oldLength);
    dailyData[index].tasks.add(task);
    final newLength = dailyData[index].tasks.length;
    setNewLength(newLength);
    taskCounter++;
    print("tarea agregada exitosamente");
    print("El id de esta nueva tarea llamada ${task.name} es ${task.id}");
    print("El id de la próxima tarea es $taskCounter");

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
  int counter = 2;
  Activity addActivity(
    int index,
    String activityName,
    Color containerColor,
  ) {
    final activity = Activity(
        id: counter.toString(),
        name: activityName,
        containerColor: containerColor);

    dailyData[index].activities.add(activity);
    counter++;
    final newActivityId = activity.id;
    print('el id de la nueva tarea es: $newActivityId');

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
