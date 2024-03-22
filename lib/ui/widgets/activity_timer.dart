import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ActivityTimer extends StatefulWidget {
  final Activity activity;
  const ActivityTimer({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  _ActivityTimerState createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer> {
  late Timer _timer;
  int _seconds = 0;
  int currentTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _seconds = _parseTime(widget.activity.time ?? "00:00:00");
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_isRunning) {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startStopTimer() {
    setState(() {
      _isRunning = !_isRunning;
      if (!_isRunning) {
        currentTime = _seconds;
        final dataService = Provider.of<DataService>(context, listen: false);
        final index = dataService.getIndex();
        widget.activity.time = _formatTime(currentTime);
        dataService.updateActivity(index, widget.activity);
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _seconds = 0;
      currentTime = _seconds;
      final dataService = Provider.of<DataService>(context, listen: false);
      final index = dataService.getIndex();
      widget.activity.time = _formatTime(currentTime);
      dataService.updateActivity(index, widget.activity);
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  int _parseTime(String formattedTime) {
    List<String> parts = formattedTime.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);
    return hours * 3600 + minutes * 60 + seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_seconds),
              style: TextStyles.h2.copyWith(fontSize: 25),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _resetTimer,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromARGB(255, 255, 141, 141),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 3),
                          blurRadius: 0.8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Icon(Ionicons.play_back),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: _startStopTimer,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      color: Color.fromARGB(255, 255, 245, 109),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 3),
                          blurRadius: 0.8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Icon(_isRunning ? Ionicons.pause : Ionicons.play),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}