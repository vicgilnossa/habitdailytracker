import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

class DateCarousel extends StatefulWidget {
  final List<WeeklyDate> weeklyDates;

  const DateCarousel({Key? key, required this.weeklyDates}) : super(key: key);

  @override
  _DateCarouselState createState() => _DateCarouselState();
}

class _DateCarouselState extends State<DateCarousel> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: CarouselSlider.builder(
        itemCount: widget.weeklyDates.length,
        options: CarouselOptions(
          initialPage: _selectedIndex,
          viewportFraction: 0.2,
          height: 79,
          onPageChanged: (index, reason) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, realIndex) {
          final weeklyDate = widget.weeklyDates[index];
          return DateCard(
            weeklyDate: weeklyDate,
            isSelected: index == _selectedIndex,
            onSelect: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
