import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

class ActivityController {
  List<Activity> activities = [
    Activity(id: "1", name: "Gym", containerColor: Color(0xff8EA99F)),
    Activity(
        id: "2",
        name: "Gym",
        containerColor: Color.fromARGB(255, 25, 203, 138)),
    Activity(
        id: "3", name: "Gym", containerColor: Color.fromARGB(255, 16, 4, 146))
  ];

  int counter = 6;

  // Método para crear una nueva tarea
  Activity createActivity(String name, Color containerColor) {
    final activity = Activity(
        id: counter.toString(), name: name, containerColor: containerColor);
    activities.add(activity);
    counter++;

    return activity;
  }

  // Método para obtener todas las tareas
  List<Activity> getAllActivities() {
    return List<Activity>.from(activities);
  }

  // Método para actualizar una tarea existente
  Activity updateActivity(Activity updatedActivity) {
    final index = activities
        .indexWhere((activities) => activities.id == updatedActivity.id);
    if (index != -1) {
      activities[index] = updatedActivity;
      return updatedActivity;
    } else {
      throw Exception('Actividad no encontrada');
    }
  }

  // Método para eliminar una tarea
  void deleteActivity(String activityId) {
    activities.removeWhere((activity) => activity.id == activityId);
  }
}
