import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_daily_tasker/services/data.dart';
import 'package:provider/provider.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class CompletedTaskCard extends StatefulWidget {
  final Task task;

  const CompletedTaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _CompletedTaskCardState createState() => _CompletedTaskCardState();
}

class _CompletedTaskCardState extends State<CompletedTaskCard> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context);
    final index = dataService.getIndex();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
                onTap: () async {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  dataService.deCompleteTask(
                      index, widget.task, widget.task.id);
                  setState(() {
                    isSelected = true;
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
                  child:
                      isSelected ? Image.asset("assets/icon_check.png") : null,
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
                        : Text(widget.task.name, style: TextStyles.p)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
