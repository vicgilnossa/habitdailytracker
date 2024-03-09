import 'package:flutter/material.dart';

class Task {
  final String id;
  final String name;
  late final bool? isCompleted;
  final Key key;

  Task({required this.id, required this.name, this.isCompleted = false, required this.key});
}
