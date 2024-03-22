import 'package:flutter/material.dart';

class Activity {
  String id;
  String name;
  String? time;
  Color containerColor;

  Activity({
    required this.id,
    required this.name,
    this.time = "00:00:00",
    required this.containerColor,
  });
}
