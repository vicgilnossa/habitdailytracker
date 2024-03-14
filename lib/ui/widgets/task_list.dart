import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';
import 'package:ionicons/ionicons.dart';

import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late List<Task> tasks;
  late ScrollController _scrollController;
  double _previousScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    tasks = [];
    _fetchTasks();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _fetchTasks() async {
    final dataService = Provider.of<DataService>(context, listen: false);
    final index = dataService.getIndex();

    final fetchedTasks = dataService.getAllTasks(index);

    setState(() {
      tasks = fetchedTasks;
      print(
          "El state de la lista es ${tasks.map((task) => task.name).toList()}");
    });

    final newLength = dataService.getNewLength();
    final oldLength = dataService.getOldLength();
    if (oldLength < newLength) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToIndex(_scrollController.position.maxScrollExtent -
            _previousScrollPosition);
      });
    }
  }

  void _onScroll() {
    _previousScrollPosition = _scrollController.position.pixels;
  }

  void _scrollToIndex(double offset) {
    _scrollController.jumpTo(offset);
  }

  void updateTasksAfterDelete() {
    _fetchTasks();
  }

  void updateTaskCard(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      final tarea = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, tarea);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: ReorderableListView(
          dragStartBehavior: DragStartBehavior.down,
          scrollController: _scrollController,
          children: [
            for (final tarea in tasks)
              _TaskCard(
                key: ValueKey(tarea),
                task: tarea,
                updateTasksAfterDelete: updateTasksAfterDelete,
              )
          ],
          onReorder: (oldIndex, newIndex) => updateTaskCard(oldIndex, newIndex),
        ),
      ),
    );
  }
}

class _TaskCard extends StatefulWidget {
  final Task task;
  final VoidCallback updateTasksAfterDelete;
  const _TaskCard({
    super.key,
    required this.task,
    required this.updateTasksAfterDelete,
  });

  @override
  State<_TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<_TaskCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
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
          leading: GestureDetector(
            onTap: _onCompleteTask,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? Colors.black : null,
              ),
              child: isSelected ? Image.asset("assets/icon_check.png") : null,
            ),
          ),
          title: Container(
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
          trailing: ReorderableDragStartListener(
            index: 1,
            child: const Icon(Ionicons.reorder_two),
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





//
