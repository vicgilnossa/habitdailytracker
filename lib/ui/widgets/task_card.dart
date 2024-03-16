import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final VoidCallback updateTasksAfterDelete;
  const TaskCard({
    super.key,
    required this.task,
    required this.updateTasksAfterDelete,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.taskScreen,
          arguments: widget.task,
        );
      },
      child: Slidable(
        endActionPane: ActionPane(motion: DrawerMotion(), children: [
          CustomSlidableAction(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
            backgroundColor: Color.fromARGB(53, 158, 158, 158),
            onPressed: (context) {},
            child: CustomCircleButton(
                onPressed: _onDeleteTask, content: const Icon(Ionicons.close)),
          ),
        ]),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: ListTile(
            tileColor: Colors.transparent,
            leading: Transform.translate(
              offset: const Offset(-15, 0.0),
              child: GestureDetector(
                onTap: _onCompleteTask,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(4),
                    color: isSelected ? Colors.black : null,
                  ),
                  child:
                      isSelected ? Image.asset("assets/icon_check.png") : null,
                ),
              ),
            ),
            title: Transform.translate(
              offset: const Offset(-18, 0.0),
              child: Container(
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20),
                  child: isSelected
                      ? Text(
                          widget.task.name,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      : Text(widget.task.name, style: TextStyles.p),
                ),
              ),
            ),
            trailing: ReorderableDragStartListener(
              index: 1,
              child: const Icon(Ionicons.reorder_two),
            ),
          ),
        ),
      ),
    );
  }

  void _onDeleteTask() {
    final dataService = Provider.of<DataService>(context, listen: false);
    final index = dataService.getIndex();
    dataService.deleteTask(index, widget.task.id);
    widget.updateTasksAfterDelete();
  }

  void _onCompleteTask() async {
    setState(() {
      isSelected = !isSelected;
    });
    await Future.delayed(Duration(seconds: 1));
    final dataService = Provider.of<DataService>(context, listen: false);
    final index = dataService.getIndex();
    dataService.completeTask(index, widget.task, widget.task.id);
    setState(() {
      isSelected = false;
    });
  }
}
