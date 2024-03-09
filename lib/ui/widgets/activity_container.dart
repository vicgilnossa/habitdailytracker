import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class ActivityContainer extends StatelessWidget {
  final double? width;
  final double height;
  final Color color;
  final String name;
  const ActivityContainer({
    Key? key,
    this.width = 0,
    required this.height,
    required this.color,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
            blurRadius: 0.8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  name,
                  style: TextStyles.p,
                ),
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "15 mins",
                  style: TextStyles.h5,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
