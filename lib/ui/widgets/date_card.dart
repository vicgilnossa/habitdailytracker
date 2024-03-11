import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';

class DateCard extends StatelessWidget {
  final Data dailyData;
  final bool isSelected;
  final VoidCallback onSelect;

  const DateCard({
    Key? key,
    required this.dailyData,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 56,
        height: 79,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 255, 101, 30)
              : const Color(0xffE5FFFFFF),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color:
                  isSelected ? Colors.black : Color.fromARGB(255, 255, 101, 30),
              offset: const Offset(3, 3),
              blurRadius: 0.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                dailyData.name,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Color(0xffE45613)),
              ),
              Spacer(),
              Text(
                dailyData.number,
                style: GoogleFonts.pressStart2p(
                    fontSize: 14,
                    color: isSelected ? Colors.black : Color(0xffE45613)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
