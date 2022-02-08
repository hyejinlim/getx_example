import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example1/screens/second/home/home_screens.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  static String routeName = "/next";
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    print(args);
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        actions: [
          IconButton(
            onPressed: () => Get.offAll(
              HomeScreen(),
              transition: Transition.noTransition,
            ),
            icon: Icon(Icons.home),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'Get.back()',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
