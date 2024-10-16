import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/auth/AuthBindings.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
