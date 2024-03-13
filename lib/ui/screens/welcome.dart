import 'package:flutter/material.dart';

import 'package:circle_list/circle_list.dart';

import 'package:habit_tracker_daily_tasker/models/models.dart';
import 'package:habit_tracker_daily_tasker/routes.dart';
import 'package:habit_tracker_daily_tasker/ui/styles/styles.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SquaredBackground(
          color: 'FFFFAD09',
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomIconButton(
                  topMargin: 10,
                  width: 40,
                  height: 40,
                  color: "6BB0A8",
                  image: 'assets/icon_goback.png',
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60, right: 50),
                    child: Text(
                      "¿Cómo te sientes hoy?",
                      style: TextStyles.h1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: _AnimatedEmojiList(emojis: emojis),
                ),
                CustomTextButton(
                  text: "Comienza tu día",
                  color: "6BB0A8",
                  function: () async {
                    Navigator.pushNamed(context, Routes.welcomeSplashScreen);
                    await Future.delayed(Duration(seconds: 5));
                    Navigator.pushNamed(context, Routes.home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedEmojiList extends StatefulWidget {
  final List<Emoji> emojis;

  const _AnimatedEmojiList({Key? key, required this.emojis}) : super(key: key);

  @override
  _AnimatedEmojiListState createState() => _AnimatedEmojiListState();
}

class _AnimatedEmojiListState extends State<_AnimatedEmojiList> {
  int _selectedIndex = -1;

  void _handleEmojiTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 535,
      child: CircleList(
        outerRadius: 300,
        innerRadius: 120,
        origin: const Offset(-100, 30),
        centerWidget: _selectedIndex == -1
            ? Container(
                width: 241,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffFF8E8E),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                      blurRadius: 0.8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Descubre tu mensaje",
                    style: TextStyles.h3,
                  ),
                ),
              )
            : _MessageBanner(
                widget: widget,
                selectedIndex: _selectedIndex,
              ),
        children: widget.emojis
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
                onTap: () {
                  _handleEmojiTap(entry.key);
                },
                child: _AnimatedEmoji(
                  emoji: entry.value,
                  isSelected: entry.key == _selectedIndex,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MessageBanner extends StatelessWidget {
  const _MessageBanner({
    super.key,
    required this.widget,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final _AnimatedEmojiList widget;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: widget.emojis[_selectedIndex].bannerColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
            blurRadius: 0.8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.emojis[_selectedIndex].message,
              style: TextStyles.h4,
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedEmoji extends StatelessWidget {
  final Emoji emoji;
  final bool isSelected;

  const _AnimatedEmoji({
    Key? key,
    required this.emoji,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        radius: isSelected ? 500 : 30,
        backgroundColor: isSelected ? Colors.blue : Colors.transparent,
        backgroundImage: AssetImage(emoji.imagePath),
      ),
    );
  }
}
