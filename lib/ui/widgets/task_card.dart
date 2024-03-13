import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final VoidCallback updateTasksAfterDelete;

  const TaskCard({
    Key? key,
    required this.task,
    required this.updateTasksAfterDelete,
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
        child: GestureDetector(
          onTap: () {},
          child: Container(
            constraints: BoxConstraints(
              minHeight: 50,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _onCompleteTask,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      color: isSelected ? Colors.black : null,
                    ),
                    child: isSelected
                        ? Image.asset("assets/icon_check.png")
                        : null,
                  ),
                ),
                Container(
                  width: 270,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 5, bottom: 20),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
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

  void _onDeleteTask() {
    final dataService = Provider.of<DataService>(context, listen: false);
    final index = dataService.getIndex();
    dataService.deleteTask(index, widget.task.id);
    widget.updateTasksAfterDelete();
  }
}
