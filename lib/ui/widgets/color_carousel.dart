import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ionicons/ionicons.dart';

class ColorCarousel extends StatefulWidget {
  final Function(Color)
      onColorSelected; // Propiedad para manejar el color seleccionado

  const ColorCarousel({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  _ColorCarouselState createState() => _ColorCarouselState();
}

class _ColorCarouselState extends State<ColorCarousel> {
  List<Color> colors = [
    const Color(0xff9D72B7),
    const Color(0xffBBB4FE),
    const Color(0xffedb4f8),
    const Color(0xffFC5D5D),
    const Color(0xffDC6BAD),
    const Color(0xffFA9EBC),
    const Color(0xffFFDA59),
    const Color(0xffFEB985),
    const Color(0xffFFDF00),
    const Color(0xff9DB772),
    const Color(0xff10B48E),
    const Color(0xffE8FC87),
    const Color(0xff72B7B7),
    const Color(0xffFF5EAEFF),
    const Color(0xffC2ECEF),
    const Color(0xff5A5558),
    const Color(0xff8EA99F),
    const Color(0xffD5D7CC),
    const Color(0xffDD8B50),
    const Color(0xff906e6C),
    const Color(0xffEFB366),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: colors.length,
          options: CarouselOptions(
            viewportFraction: 0.3,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _selectedIndex = index;
              });
              widget.onColorSelected(colors[
                  index]); // Llamar a la función de devolución de llamada con el color seleccionado
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final color = colors[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onColorSelected(
                    color); // Llamar a la función de devolución de llamada con el color seleccionado
              },
              child: Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: _selectedIndex == index
                    ? Icon(
                        Ionicons.checkmark,
                        color: Colors.white,
                      )
                    : SizedBox(),
              ),
            );
          },
        ),
      ],
    );
  }
}
