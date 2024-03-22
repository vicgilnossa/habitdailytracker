import 'package:flutter/material.dart';
import 'package:habit_tracker_daily_tasker/models/models.dart';

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:ionicons/ionicons.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
        body: SafeArea(
      child: SimpleBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIconButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  topMargin: 10,
                  leftMargin: 20,
                  width: 30,
                  height: 30,
                  color: "ffffff",
                  image: "assets/icon_goback.png"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 300,
                      child: Text(
                        task.name,
                        style: TextStyles.h3,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Ionicons.notifications),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Recordarme",
                      style: TextStyles.h4,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Ionicons.calendar),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 190,
                      child: Text(
                        "Agregar fecha de vencimiento",
                        style: TextStyles.h4,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Ionicons.repeat_sharp),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 190,
                      child: Text(
                        "Repetir",
                        style: TextStyles.h4,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Ionicons.cloud_upload),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Agregar archivos",
                      style: TextStyles.h4,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Ionicons.document),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Agregar nota",
                      style: TextStyles.h4,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200, left: 20, right: 20),
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Ionicons.trash),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Eliminar tarea",
                      style: TextStyles.h4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
