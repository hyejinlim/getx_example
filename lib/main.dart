import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_example1/screens/second/home/home_screens.dart';
import 'routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx example1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      getPages: routes,
    );
  }
}
