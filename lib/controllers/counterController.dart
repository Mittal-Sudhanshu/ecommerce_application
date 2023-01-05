import 'package:get/get.dart';

class CounterController extends GetxController {
  var x = 0.obs;
  var isVisible = false.obs;
  incremet() {
    x.value++;
  }

  decrement() {
    x.value--;
  }
}
