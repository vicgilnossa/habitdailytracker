import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';
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
      child: ReorderableListView(
        scrollController: _scrollController,
        children: [
          for (final tarea in tasks)
            TaskCard(
              key: ValueKey(tarea),
              task: tarea,
              updateTasksAfterDelete: updateTasksAfterDelete,
            )
        ],
        onReorder: (oldIndex, newIndex) => updateTaskCard(oldIndex, newIndex),
      ),
    );
  }
}
