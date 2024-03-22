import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';

class ActivityContainer extends StatelessWidget {
  final double? width;
  final double height;
  final double? textWidth;
  final Color color;
  final String name;
  final String time;
  const ActivityContainer({
    Key? key,
    this.width = 0,
    required this.height,
    this.textWidth,
    required this.color,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
            blurRadius: 0.8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: textWidth,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  name,
                  style: TextStyles.p,
                ),
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  timeToText(time),
                  style: TextStyles.h5,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

String timeToText(String time) {
  // Dividir la cadena en horas, minutos y segundos
  List<String> partes = time.split(':');
  int horas = int.parse(partes[0]);
  int minutos = int.parse(partes[1]);
  int segundos = int.parse(partes[2]);

  // Si hay horas, mostrar solo las horas
  if (horas > 0) {
    return '$horas Hora${horas > 1 ? 's' : ''}';
  }

  // Si hay minutos, mostrar solo los minutos
  if (minutos > 0) {
    return '$minutos Min${minutos > 1 ? 's' : ''}';
  }

  // Si hay segundos, mostrar solo los segundos
  if (segundos > 0) {
    return '$segundos Seg${segundos > 1 ? 's' : ''}';
  }

  // Si no hay ninguna unidad de tiempo
  return '0 Segs';
}
