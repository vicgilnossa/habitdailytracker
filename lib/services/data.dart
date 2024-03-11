import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/controllers/data.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

class DataService extends ChangeNotifier {
  final DataController _dailyDataController = DataController();

//MÉTODO PARA GUARDAR Y REUTILIZAR EL INDEX, ES DECIR, EL DÍA
  void setIndex(int index) {
    notifyListeners();
    _dailyDataController.setIndex(index);
  }

  int getIndex() {
    notifyListeners();
    return _dailyDataController.getIndex();
  }

//CRUD DE TAREAS
  //create
  Task addTask(
    int index,
    String taskName,
  ) {
    notifyListeners();
    return _dailyDataController.addTask(index, taskName);
  }

  //read
  List<Task> getAllTasks(int index) {
    notifyListeners();
    return _dailyDataController.getAllTasks(index);
  }

  List<Task> getAllCompletedTasks(int index) {
    notifyListeners();
    return _dailyDataController.getAllCompletedTasks(index);
  }

  //update
  Task updateTask(Task updatedTask, int index) {
    notifyListeners();
    return _dailyDataController.updateTask(updatedTask, index);
  }

  void completeTask(int index, Task task, String taskId) {
    _dailyDataController.completeTask(index, task, taskId);
    notifyListeners();
  }

  void deCompleteTask(int index, Task task, String taskId) {
    _dailyDataController.deCompleteTask(index, task, taskId);
    notifyListeners();
  }

  //delete
  void deleteTask(int index, String taskId) {
    _dailyDataController.deleteTask(index, taskId);
    notifyListeners();
  }

//CRUD DE ACTIVIDADES
  //create
  Activity addActivity(
    int index,
    String activityName,
    Color containerColor,
  ) {
    notifyListeners();
    return _dailyDataController.addActivity(
        index, activityName, containerColor);
  }

  //read
  List<Activity> getAllActivities(int index) {
    notifyListeners();
    return _dailyDataController.getAllActivities(index);
  }

  //update
  Activity updateActivity(
    int index,
    Activity updatedActivity,
  ) {
    notifyListeners();
    return _dailyDataController.updateActivity(index, updatedActivity);
  }

  //delete
  void deleteActivity(int index, String activityId) {
    _dailyDataController.deleteActivity(index, activityId);
    notifyListeners();
  }

//TRAER TODA LA DATA
  List<Data> getAllData() {
    notifyListeners();
    return _dailyDataController.getAllData();
  }
}
