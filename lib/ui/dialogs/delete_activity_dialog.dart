import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:provider/provider.dart';

class DeleteActivityDialog extends StatelessWidget {
  const DeleteActivityDialog({
    super.key,
    required this.activity,
    required this.toHome,
  });

  final Activity activity;
  final bool toHome;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shadowColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.23,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 45, 40, 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 140, 140, 140),
              border: Border.all(color: Colors.black, width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 3),
                  blurRadius: 0.8,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Text(
                  "¿Seguro?",
                  style: TextStyles.h3,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                    activity: activity,
                    text: 'Aceptar',
                    function: () {
                      final dataService =
                          Provider.of<DataService>(context, listen: false);
                      final index = dataService.getIndex();
                      dataService.deleteActivity(index, activity.id);

                      Navigator.pushNamed(context,
                          toHome ? Routes.home : Routes.showActivities);
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
