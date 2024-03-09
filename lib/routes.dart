import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/ui/screens/screens.dart';
import 'package:habit_tracker_daily_tasker/ui/transitionscreens/welcome_splash_screen.dart';
import 'package:habit_tracker_daily_tasker/ui/widgets/widgets.dart';

class Routes {
  static const String activityScreen = 'activityscreen';
  static const String animationTest = 'atest';
  static const String home = 'home';
  static const String showActivities = 'showactivities';
  static const String welcome = 'welcome';
  static const String welcomeSplashScreen = 'welcomesplashscreen';

  static final Map<String, WidgetBuilder> routes = {
    activityScreen: (context) => const ActivityScreen(),
    animationTest: (context) => const AnimationTestScreen(),
    home: (context) => const HomeScreen(),
    showActivities: (context) => const ShowAllActivitiesScreen(),
    welcome: (context) => const WelcomeScreen(),
    welcomeSplashScreen: (context) => const WelcomeSplashScreen(),
  };
}
