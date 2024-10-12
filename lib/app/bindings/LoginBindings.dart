import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/auth/LoginController.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
