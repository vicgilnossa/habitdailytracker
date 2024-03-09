import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/controllers/controllers.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

class ActivityService extends ChangeNotifier {
  final ActivityController _activityController = ActivityController();

  // Método para crear una nueva tarea
  Activity createActivity(String name, Color containerColor) {
    notifyListeners();
    return _activityController.createActivity(name, containerColor);
  }

  // Método para obtener todas las tareas
  List<Activity> getAllActivities() {
    return _activityController.getAllActivities();
  }

  // Método para actualizar una tarea existente
  Activity updateActivity(Activity updatedActivity) {
    return _activityController.updateActivity(updatedActivity);
  }

  // Método para eliminar una tarea
  void deleteActivity(String activityId) {
    notifyListeners();
    _activityController.deleteActivity(activityId);
  }
}
