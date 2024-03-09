import 'package:flutter/material.dart';

class Emoji {
  final String imagePath;
  final String message;
  final Color bannerColor;

  Emoji({
    required this.imagePath,
    required this.message,
    required this.bannerColor,
  });
}

final List<Emoji> emojis = [
      Emoji(
          imagePath: 'assets/smiley_afraid.png',
          message: '"Empieza ahora, el miedo se disipa con la acción."',
          bannerColor: const Color(0xffFF69B4)),
      Emoji(
          imagePath: 'assets/smiley_decided.png',
          message:
              '"Confía en tu capacidad para brillar incluso en la oscuridad"',
          bannerColor: Color(0xffBAFCA2)),
      Emoji(
          imagePath: 'assets/smiley_doubtful.png',
          message:
              '"La duda es solo un escalón en el camino hacia la confianza."',
          bannerColor: Color(0xffFFC1C1)),
      Emoji(
          imagePath: 'assets/smiley_happy.png',
          message:
              '"La felicidad no es algo que se experimenta, se elige cada día."',
          bannerColor: Color(0xffCC4A1FF)),
      Emoji(
          imagePath: 'assets/smiley_lovely.png',
          message: '"El amor es el único tesoro que crece cuando se comparte."',
          bannerColor: Color(0xffffA07A)),
      Emoji(
          imagePath: 'assets/smiley_sad.png',
          message:
              '"La tristeza es solo una nube pasajera en el cielo del alma."',
          bannerColor: Color(0xff69D2E7)),
      Emoji(
          imagePath: 'assets/smiley_shocked.png',
          message:
              '"Cada día trae consigo la posibilidad de una nueva sorpresa."',
          bannerColor: Color(0xffFF6B6B)),
      Emoji(
          imagePath: 'assets/smiley_sick.png',
          message:
              '"Contra la enfermedad, el coraje y la esperanza son nuestras mejores armas."',
          bannerColor: Color(0xffF4D738)),
      Emoji(
          imagePath: 'assets/smiley_uncomfortable.png',
          message: '"La incomodidad es un trampolín hacia el crecimiento."',
          bannerColor: Color(0xff7FBC8C)),
      Emoji(
          imagePath: 'assets/smiley_wippey.png',
          message: '"En el duelo encontramos la fuerza para seguir adelante."',
          bannerColor: Color(0xffD3EF65))
    ];
