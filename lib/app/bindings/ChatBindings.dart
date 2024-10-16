import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/fitur/ChatController.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
