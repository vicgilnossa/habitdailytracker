import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final Widget dialog;
  const DialogButton({
    super.key,
    required this.dialog,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (context) => dialog);
      },
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Image.asset('assets/icon_add.png', width: 40, height: 40),
    );
  }
}
