import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:habit_tracker_daily_tasker/services/task.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({Key? key}) : super(key: key);

  @override
  _CreateTaskDialogState createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _textEditingController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TaskService>(context);
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 205, 88),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: TextStyles.h5,
                cursorColor: Colors.black,
                autofocus: true,
                controller: _textEditingController,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Nueva tarea',
                  hintStyle: TextStyles.p,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(2),
                  backgroundColor: _isButtonEnabled
                      ? MaterialStateProperty.all<Color>(Color(0xff6BB0A8))
                      : MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 211, 218, 216)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Colors.black, // Color del borde
                      width: 1, // Ancho del borde en píxeles
                    ),
                  ),
                ),
                onPressed: _isButtonEnabled
                    ? () {
                        taskService.createTask(_textEditingController.text);

                        print(
                            'Texto ingresado: ${_textEditingController.text}');
                        Navigator.pop(context);
                      }
                    : null,
                child: Text('Crear', style: TextStyles.h5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
