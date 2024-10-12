import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/main/IndexMainController.dart';

class IndexMainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexMainController>(() => IndexMainController());
  }
}
