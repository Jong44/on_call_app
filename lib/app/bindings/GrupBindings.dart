import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/fitur/GrupController.dart';

class GrupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GrupController());
  }
}
