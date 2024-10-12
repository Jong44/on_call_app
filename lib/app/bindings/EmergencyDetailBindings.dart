import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/main/EmergencyDetailController.dart';

class EmergencyDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergencyDetailController>(() => EmergencyDetailController());
  }
}
