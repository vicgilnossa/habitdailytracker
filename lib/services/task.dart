import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/controllers/controllers.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

class TaskService extends ChangeNotifier {
  final TaskController _taskController = TaskController();

  // Método para crear una nueva tarea
  Task createTask(String name) {
    notifyListeners();
    return _taskController.createTask(name);
  }

  // Método para obtener todas las tareas
  List<Task> getAllTasks() {
    notifyListeners();
    return _taskController.getAllTasks();
  }

  List<Task> getAllCompletedTasks() {
    notifyListeners();
    return _taskController.getAllCompletedTasks();
  }

  // Método para actualizar una tarea existente
  Task updateTask(Task updatedTask) {
    notifyListeners();
    return _taskController.updateTask(updatedTask);
  }

  // Método para eliminar una tarea
  void deleteTask(String taskId) {
    _taskController.deleteTask(taskId);
    notifyListeners();
  }

  void completeTask(Task task, String taskId) {
    _taskController.completeTask(task, taskId);
    notifyListeners();
  }

  void deCompleteTask(Task task, String taskId) {
    _taskController.deCompleteTask(task, taskId);
    notifyListeners();
  }
}
