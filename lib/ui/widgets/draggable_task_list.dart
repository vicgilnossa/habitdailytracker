import 'package:flutter/material.dart' hide ReorderableList;

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:provider/provider.dart';

import '../../services/data.dart';

class DraggableTaskList extends StatefulWidget {
  const DraggableTaskList({
    Key? key,
  }) : super(key: key);

  @override
  _DraggableTaskListState createState() => _DraggableTaskListState();
}

enum DraggingMode {
  iOS,
  android,
}

class _DraggableTaskListState extends State<DraggableTaskList> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = [];
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final dataService = Provider.of<DataService>(context, listen: false);
    final day = dataService.getSelectedDay();

    final fetchedTasks = dataService.getAllTasks(day);

    setState(() {
      tasks = fetchedTasks;
      print(
          "El estado de la lista es ${tasks.map((task) => task.name).toList()}");
    });
  }

  void updateTasksAfterDelete() {
    _fetchTasks();
  }

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return tasks.indexWhere((Task d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    final draggedItem = tasks[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      tasks.removeAt(draggingIndex);
      tasks.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = tasks[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.name}}");
  }

  DraggingMode _draggingMode = DraggingMode.iOS;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: ReorderableList(
            onReorder: _reorderCallback,
            onReorderDone: _reorderDone,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return DraggableTaskCard(
                          data: tasks[index],
                          isFirst: index == 0,
                          isLast: index == tasks.length - 1,
                          draggingMode: _draggingMode,
                          updateTasksAfterDelete: updateTasksAfterDelete,
                        );
                      },
                      childCount: tasks.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
