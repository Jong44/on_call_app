import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/auth/RegisterController.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
