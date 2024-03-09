import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/services/services.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

import 'package:provider/provider.dart';

class CreateActivityDialog extends StatefulWidget {
  const CreateActivityDialog({Key? key}) : super(key: key);

  @override
  _CreateActivityDialogState createState() => _CreateActivityDialogState();
}

class _CreateActivityDialogState extends State<CreateActivityDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isButtonEnabled = false;
  late Color _containerColor; // Variable para almacenar el color seleccionado

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateButtonState);
    _containerColor = const Color(0xff9D72B7); // Color inicial
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

  void _onColorSelected(Color color) {
    setState(() {
      _containerColor = color; // Actualizar el color seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    final activityService = Provider.of<ActivityService>(context);
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 145, 0),
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
                  hintText: 'Nueva actividad',
                  hintStyle: TextStyles.p,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 90,
                child: ColorCarousel(onColorSelected: _onColorSelected),
              ),
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
                    const BorderSide(
                      color: Colors.black, // Color del borde
                      width: 1, // Ancho del borde en píxeles
                    ),
                  ),
                ),
                onPressed: _isButtonEnabled
                    ? () {
                        activityService.createActivity(
                            _textEditingController.text, _containerColor);
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
