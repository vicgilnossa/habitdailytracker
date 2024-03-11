import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/controllers/data.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

class DataService extends ChangeNotifier {
  final DataController _dailyDataController = DataController();

  // Métodos para establecer index y día
  void setSelectedDay(String day) {
    notifyListeners();
    _dailyDataController.setSelectedDay(day);
  }

  String getSelectedDay() {
    notifyListeners();
    return _dailyDataController.getSelectedDay();
  }

  void setIndex(int index) {
    notifyListeners();
    _dailyDataController.setIndex(index);
  }

  int getIndex() {
    notifyListeners();
    return _dailyDataController.getIndex();
  }

  // Métodos para añadir datos
  Task addTask(
    int index,
    String taskName,
  ) {
    notifyListeners();
    return _dailyDataController.addTask(index, taskName);
  }

  Activity addActivity(
    int index,
    String activityName,
    Color containerColor,
  ) {
    notifyListeners();
    return _dailyDataController.addActivity(
        index, activityName, containerColor);
  }

  // Método para obtener toda la data
  List<Data> getAllData() {
    notifyListeners();
    return _dailyDataController.getData();
  }

  // Método para obtener todas las tareas del día
  List<Task> getAllTasks(String day) {
    notifyListeners();
    return _dailyDataController.getAllTasks(day);
  }

  // Método para obtener todas las tareas del día
  List<Task> getAllActivities(String day) {
    notifyListeners();
    return _dailyDataController.getAllActivities(day);
  }

  void completeTask(Task task, String taskId, int index) {
    _dailyDataController.completeTask(task, taskId, index);
    notifyListeners();
  }
}
