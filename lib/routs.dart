import 'package:get/get.dart';
import 'package:getx_example1/screens/second/home/home_screens.dart';
import 'package:getx_example1/screens/second/second_screen.dart';

// we use name route
// all our routes will be available here
final List<GetPage> routes = [
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
  GetPage(name: SecondScreen.routeName, page: () => SecondScreen()),
];
