import 'package:flutter/material.dart';

import 'package:habit_tracker_daily_tasker/routes.dart';

import 'package:habit_tracker_daily_tasker/services/data.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataService>(
          create: (_) => DataService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.home,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}
