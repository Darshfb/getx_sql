import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';

class TasksBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLController());
  }
}
