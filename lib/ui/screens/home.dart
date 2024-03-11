import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';
import 'package:habit_tracker_daily_tasker/services/data.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/dialogs/dialogs.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context);
    final index = dataService.getIndex();
    final tasks = dataService.getAllTasks(index);
    final hasTask = tasks.isNotEmpty;

    final activities = dataService.getAllActivities(index);
    final hasActivity = activities.isNotEmpty;

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const DialogButton(
          dialog: CreateTaskDialog(),
        ),
        body: SimpleBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: _HeaderBar(),
                ),
                const DateCarousel(),
                _ActivityPannel(
                  hasActivity: hasActivity,
                ),
                _TaskPannel(
                  hasTask: hasTask,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  const _HeaderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomEmojiButton(),
        SizedBox(width: 15),
        _HeadingUserName(),
        Spacer(),
        CustomIconButton(
          leftMargin: 0,
          topMargin: 0,
          width: 40,
          height: 40,
          color: "6BB0A8",
          image: 'assets/icon_settings.png',
        ),
      ],
    );
  }
}

class _TaskPannel extends StatelessWidget {
  final bool hasTask;

  const _TaskPannel({
    super.key,
    required this.hasTask,
  });

  @override
  Widget build(BuildContext context) {
    return hasTask ? const _ShowTask() : const _AddTask();
  }
}

class _AddTask extends StatelessWidget {
  const _AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context);
    final index = dataService.getIndex();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Tareas diarias",
                style: TextStyles.h3,
              ),
            ),
          ),
          Text(
            "¡Crea una tarea!",
            style: TextStyles.p,
          ),
          const SizedBox(
            height: 40,
          ),
          CompletedTaskList(task: dataService.getAllCompletedTasks(index))
        ],
      ),
    );
  }
}

class _ShowTask extends StatelessWidget {
  const _ShowTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context, listen: false);
    final index = dataService.getIndex();

    final bool hasCompletedTask =
        dataService.getAllCompletedTasks(index).isNotEmpty;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Tareas diarias",
                style: TextStyles.h3,
              ),
            ),
          ),
          DraggableTaskList(
            key: UniqueKey(),
          ),
          const SizedBox(
            height: 50,
          ),
          hasCompletedTask
              ? CompletedTaskList(task: dataService.getAllCompletedTasks(index))
              : Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Completadas",
                          style: TextStyles.h3,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "No has completado ninguna tarea",
                        style: TextStyles.p,
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class _ActivityPannel extends StatelessWidget {
  final bool hasActivity;
  const _ActivityPannel({
    super.key,
    required this.hasActivity,
  });

  @override
  Widget build(BuildContext context) {
    return hasActivity ? _ShowActivity() : _AddActivity();
  }
}

class _ShowActivity extends StatelessWidget {
  const _ShowActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context);
    final index = dataService.getIndex();
    final List<Activity> activities = dataService.getAllActivities(index);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Actividades",
                    style: TextStyles.h3,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.showActivities);
                      },
                      child: Text(
                        "Ver todas",
                        style: TextStyles.p,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              activities.length >= 2
                  ? Expanded(
                      flex: 2,
                      child: ActivityContainer(
                        height: 69,
                        color: activities[1].containerColor,
                        name: activities[1].name,
                      ),
                    )
                  : Container(),
              const SizedBox(
                width: 10,
              ),
              activities.length >= 3
                  ? Expanded(
                      flex: 1,
                      child: ActivityContainer(
                        height: 69,
                        color: activities[2].containerColor,
                        name: activities[2].name,
                      ))
                  : Expanded(flex: 1, child: Container())
            ],
          ),
          activities.length >= 1
              ? Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ActivityContainer(
                    width: double.infinity,
                    height: 69,
                    color: activities[0].containerColor,
                    name: activities[0].name,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class _AddActivity extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreateActivityDialog();
      },
    );
  }

  const _AddActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Text(
              "Actividades",
              style: TextStyles.h3,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "¡Crea una actividad!",
                style: TextStyles.p,
              ),
            ),
          ),
        ),
        CustomIconButton(
            topMargin: 10,
            width: 40,
            height: 40,
            color: "000000",
            image: "assets/icon_add.png",
            onTap: () {
              _showAlertDialog(context);
            }),
      ],
    );
  }
}

class _HeadingUserName extends StatelessWidget {
  const _HeadingUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Víctor",
      style: TextStyles.h3,
    );
  }
}

class CustomEmojiButton extends StatelessWidget {
  const CustomEmojiButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
            blurRadius: 0.8,
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
