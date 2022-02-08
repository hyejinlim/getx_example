import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example1/controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  static String routeName = "/counter";
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx State example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // init 을 설정하지 않으면 에러가 발생함
            GetBuilder<Controller>(
              // init: Controller(),
              builder: (_) => Text(
                'clicks: ${_.count1}',
              ),
            ),
            /* 
            Get.find<Controller>()가 Controller를 찾는 시점이
            GetBuilder()의 init에서 Controller를 등록하기 이전이라서?
            */
            Wrap(
              children: [
                TextButton(
                  onPressed: controller.increment1,
                  child: Text('increment1'),
                ),
                TextButton(
                  onPressed: controller.decrement1,
                  child: Text('decrement1'),
                ),
              ],
            ),

            // getx 사용방법
            GetX<Controller>(
              builder: (_) => Text(
                'clicks: ${_.count2.value}',
              ),
            ),

            // obx 사용방법
            Obx(() {
              return Text(
                "clicks: ${controller.count2.value}",
              );
            }),

            Wrap(
              children: [
                TextButton(
                  onPressed: controller.increment2,
                  child: Text(
                    'increment2',
                  ),
                ),
                TextButton(
                  onPressed: controller.decrement2,
                  child: Text(
                    'decrement2',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
