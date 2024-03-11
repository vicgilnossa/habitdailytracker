import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class DraggableTaskCard extends StatefulWidget {
  final Task data;
  final bool isFirst;
  final bool isLast;
  final DraggingMode draggingMode;
  final VoidCallback updateTasksAfterDelete;
  const DraggableTaskCard({
    Key? key,
    required this.data,
    required this.isFirst,
    required this.isLast,
    required this.draggingMode,
    required this.updateTasksAfterDelete,
  }) : super(key: key);

  @override
  State<DraggableTaskCard> createState() => _DraggableTaskCardState();
}

class _DraggableTaskCardState extends State<DraggableTaskCard> {
  bool isSelected = false;
  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // Color cuando se arrastra la tarjeta (just like on iOS)
      decoration = const BoxDecoration(color: Colors.transparent);
    } else {
      //bool placeholder = state == ReorderableItemState.placeholder; && decoración de las tarjetas estáticas.
      decoration = const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      );
    }

    // For iOS dragging mode, there will be drag handle on the right that triggers
    // reordering; For android mode it will be just an empty container
    Widget dragHandle = widget.draggingMode == DraggingMode.iOS
        ? ReorderableListener(
            child: Container(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: const Center(
                child: Icon(Ionicons.reorder_two, color: Colors.black),
              ),
            ),
          )
        : Container();

    Widget content = Container(
      decoration: decoration,
      child: Slidable(
        endActionPane: ActionPane(motion: DrawerMotion(), children: [
          CustomSlidableAction(
            backgroundColor: Color.fromARGB(53, 158, 158, 158),
            onPressed: (context) {},
            child: CustomCircleButton(
                onPressed: () {
                  final dataService =
                      Provider.of<DataService>(context, listen: false);
                  final index = dataService.getIndex();
                  dataService.deleteTask(index, widget.data.id);
                  widget.updateTasksAfterDelete();
                },
                content: const Icon(Ionicons.close)),
          ),
        ]),
        child: SafeArea(
            top: false,
            bottom: false,
            child: Opacity(
              // Oculta la tarjeta cuando la arrastras, deja el contenedor "vacío" o el efecto de "abrirse campo".
              opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        final dataService =
                            Provider.of<DataService>(context, listen: false);
                        final index = dataService.getIndex();
                        setState(() {
                          isSelected = !isSelected;
                        });

                        await Future.delayed(const Duration(seconds: 1));
                        dataService.completeTask(
                            index, widget.data, widget.data.id);
                        widget.updateTasksAfterDelete();
                        setState(() {
                          isSelected = false;
                        });
                      },
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
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 14.0),
                      child: isSelected
                          ? Text(
                              widget.data.name,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          : Text(widget.data.name, style: TextStyles.p),
                    )),
                    // Llama el reordenamiento
                    dragHandle,
                  ],
                ),
              ),
            )),
      ),
    );

    // Si el dragging mode es Android, lo envuelve en un widget para darle el efecto.
    if (widget.draggingMode == DraggingMode.android) {
      content = DelayedReorderableListener(
        child: content,
      );
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: widget.data.key, //
        childBuilder: _buildChild);
  }
}
