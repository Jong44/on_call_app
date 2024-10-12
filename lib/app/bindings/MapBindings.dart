import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/main/MapController.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
