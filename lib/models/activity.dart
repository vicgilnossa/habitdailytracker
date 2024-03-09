import 'dart:async';
import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class Activity {
  final String id;
  final String name;
  final Color containerColor;
  late final Stopwatch stopwatch;

  Activity({
    required this.id,
    required this.name,
    required this.containerColor,
  }) {
    stopwatch = Stopwatch();
  }

  void startTimer() {
    stopwatch.start();
  }

  void stopTimer() {
    stopwatch.stop();
  }

  Duration getElapsedTime() {
    return stopwatch.elapsed;
  }
}

class TimerWidget extends StatefulWidget {
  final Activity activity;

  TimerWidget({required this.activity});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Duration elapsedTime = widget.activity.getElapsedTime();
    String formattedTime = formatDuration(elapsedTime);
    return Text(
      formattedTime,
      style: TextStyles.p,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
}
