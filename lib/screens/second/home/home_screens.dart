import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example1/screens/second/counter/counter_screen.dart';
import 'package:getx_example1/screens/second/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx example1'),
      ),
      body: Center(
        child: Column(
          children: [
            // 새로운 화면으로 이동
            TextButton(
              onPressed: () => Get.to(SecondScreen()),
              child: Text('Get.to()'),
            ),
            // 미리 설정해둔 이름을 통해 새로운 화면으로 이동
            TextButton(
              onPressed: () => Get.toNamed(
                '/next',
                arguments: 'Get is the best',
              ),
              child: Text('Get.toNamed()'),
            ),
            // 다음 화면으로 이동하면서 이전 화면 하나만 없앰
            // 이전 화면으로 돌아갈 필요가 없을 때 사용
            TextButton(
              onPressed: () => Get.off(SecondScreen()),
              child: Text('Get.off()'),
            ),
            TextButton(
              onPressed: () => Get.offNamed('/next'),
              child: Text('Get.offNamed()'),
            ),
            // 이전의 모든 화면을 없애고 다음 화면으로 이동
            TextButton(
              onPressed: () => Get.offAll(SecondScreen()),
              child: Text('Get.offAll()'),
            ),
            // toast 기능이랑 비슷함
            TextButton(
              onPressed: () => Get.snackbar(
                'snackbar title',
                'snackbar message',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.black87,
                colorText: Colors.white,
                duration: Duration(seconds: 2),
              ),
              child: Text('Get.snackbar()'),
            ),
            // snackbar() 랑 비슷한 기능을 하나 getbar를 사용해서 그런지 기본적인 디자인에 차이가 있다.
            // showsnackbar() 보다는 snackbar()를 더 많이 사용할 것 같다.
            TextButton(
              onPressed: () => Get.showSnackbar(GetBar(
                title: 'snackbar title',
                message: 'snackbar message',
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 2),
              )),
              child: Text('Get.showSnackbar()'),
            ),
            // dialog를 화면에 띄어줌
            TextButton(
              onPressed: () => Get.defaultDialog(
                title: 'dialog title',
                middleText: 'dialog text',
                onConfirm: () => Navigator.pop(context),
                onCancel: () => Navigator.pop(context),
                textConfirm: '확인',
                textCancel: '취소',
              ),
              child: Text('Get.defaultDialog()'),
            ),
            // 원래 사용하던 dialog 위젯을 가져와서 사용할 수 있음
            // 새로 시작하는 플젝에서 getx를 적용할 때는 get.defaultdialof()를 사용하는 것이 좋지만,
            // 원래 존재하는 프로젝트에 getx를 적용할 때는 get.dialog()를 통해
            // 기존 dialog 위젯을 복사하여 빠르게 작업하는 편이 좋을 것 같다
            // 고 누군가가 적어놓음 -> 생각해봐야지...
            TextButton(
              onPressed: () => Get.dialog(
                Dialog(
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text('dialog'),
                    ),
                  ),
                ),
              ),
              child: Text('Get.dialog()'),
            ),
            // 내부에 들어갈 위젯만 넣어주면 해당 위젯을 포함하는 bottomsheet를 보여줌
            TextButton(
              onPressed: () => Get.bottomSheet(
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Center(
                    child: Text('bottomsheet'),
                  ),
                ),
              ),
              child: Text('Get.bottomSheet()'),
            ),
            Spacer(),
            TextButton(
              onPressed: () => Get.to(CounterScreen()),
              child: Text('go to counter page'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
