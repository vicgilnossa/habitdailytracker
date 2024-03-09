import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/models/task.dart';

class TaskController {
  List<Task> tasks = [
    Task(id: "1", name: "Hacer pedido en Rappi", key: ValueKey(1)),
    Task(id: "2", name: "Facturar cheques de renta", key: ValueKey(2)),
    Task(id: "3", name: "Llamar a la abuela", key: ValueKey(3))
  ];

  List<Task> completedTasks = [];

  int counter = 4;
  int keyCounter = 4;

  // Método para crear una nueva tarea
  Task createTask(String name) {
    final task =
        Task(id: counter.toString(), name: name, key: ValueKey(keyCounter));
    tasks.add(task);
    print("tarea agregada exitosamente");
    print(
        "El estado de la lista es ${tasks.map((task) => task.name).toList()}");
    print("El key de la lista es ${tasks.map((task) => task.key).toList()}");
    counter++;
    keyCounter++;
    

    return task;
  }

  // Método para obtener todas las tareas
  List<Task> getAllTasks() {
    return List<Task>.from(tasks);
  }

  List<Task> getAllCompletedTasks() {
    return List<Task>.from(completedTasks);
  }

  // Método para actualizar una tarea existente
  Task updateTask(Task updatedTask) {
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      return updatedTask;
    } else {
      throw Exception('Tarea no encontrada');
    }
  }

  // Método para eliminar una tarea
  void deleteTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
  }

  Future<Task> completeTask(Task task, String taskId) async {
    completedTasks.add(task);
    tasks.removeWhere((task) => task.id == taskId);

    return task;
  }

  Future<Task> deCompleteTask(Task task, String taskId) async {
    tasks.add(task);
    completedTasks.removeWhere((task) => task.id == taskId);

    return task;
  }
}
