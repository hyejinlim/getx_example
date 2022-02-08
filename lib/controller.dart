import 'package:get/get.dart';

class Controller extends GetxController {
  /* 
  1. simple 방식 
  - 메모리를 적게 사용한다는 장점이 있음
  */
  var count1 = 0;

  void increment1() {
    count1 += 1;
    // update()는 changenotifier 의 notifylisteners()와 동일하게 생각
    update();
  }

  void decrement1() {
    count1 -= 1;
    update();
  }

  /*  
  2. reactive 방식
  - observable 라는 변수를 사용
  - observable 변수를 Rx라고도 부름
  - Rx를 선언하는 방법에는 3가지가 있음
    - Value.obs => 간단해서 주로 사용함
    - Rx<Type>(Value)
    - RxType(Value)

  Rx의 값을 접근할 때는 일반적인 변수의 값의 경우와 다르게 .value를 통해 접근할 수 있음
  주의할 점은, String과 int 같은 primitive type에는 .value를 사용해야하지만,
  List에서는 .value가 필요없음
  dart api가 리스트에서만 .value 없이도 값에 접근할 수 있게 해주기 때문
  => code generator와 decoration을 사용하면 이 불편함을 해결할 수 있지만,
  외부 종속성을 없애고자 그대로 두었다고 함

  Workers : Rx들의 변화를 감지하고 다양한 상황별로 적절한 대응을 하도록 구현 가능
  - controller 혹은 클래스를 시작할 때만 사용할 수 있음
  - 항상 onInit 내에 있거나(권장사항), 클래스 생성자, 등에 있어야함
  */
  var count2 = 0.obs; // 1번
  // var count2 = Rx<int>(0); // 2번
  // var count2 = RxInt(0); // 3번

  void increment2() => count2.value++;
  void decrement2() => count2.value--;

  @override
  void onInit() {
    super.onInit();

    // 사용하고자 하는 worker 등록

    // count2가 처음으로 변경되었을 때만 호출
    once(count2, (_) {
      print('$_이 처음으로 변경되었습니다.');
    });

    // count2가 변경될 때마다 호출
    ever(count2, (_) {
      print('$_이 변경되었습니다.');
    });

    // count2가 변경되다가 마지막 변경 후, 1초간 변경이 없을 때 호출
    debounce(
      count2,
      (_) {
        print('$_가 마지막으로 변경된 이후, 1초간 변경이 없습니다.');
      },
      time: Duration(seconds: 1),
    );

    // count2가 변경되고 있는 동안, 1초마다 호출
    interval(
      count2,
      (_) {
        print('$_가 변경되는 중입니다. (1초마다 호출)');
      },
      time: Duration(seconds: 1),
    );
  }
}
