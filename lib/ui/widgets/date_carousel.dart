import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:habit_tracker_daily_tasker/services/data.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DateCarousel extends StatefulWidget {
  const DateCarousel({
    Key? key,
  }) : super(key: key);

  @override
  _DateCarouselState createState() => _DateCarouselState();
}

class _DateCarouselState extends State<DateCarousel> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dailyDataService = Provider.of<DataService>(context, listen: false);
    final dailyDatas = dailyDataService.getAllData();
    return Container(
      width: double.infinity,
      height: 100,
      child: CarouselSlider.builder(
        itemCount: dailyDatas.length,
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
          final dailyData = dailyDatas[index];
          return DateCard(
            dailyData: dailyData,
            isSelected: index == _selectedIndex,
            onSelect: () {
              setState(() {
                _selectedIndex = index;

                final ourIndex = dailyData.id;

                print("El index en el index es $ourIndex");
                final dataService =
                    Provider.of<DataService>(context, listen: false);

                dataService.setIndex(ourIndex);

                final internalIndex = dataService.getIndex();

                print("El index interno es $internalIndex");
              });
            },
          );
        },
      ),
    );
  }
}
