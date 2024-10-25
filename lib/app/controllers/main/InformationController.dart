import 'package:get/get.dart';

class InformationController extends GetxController {
  List corouselList = [
    "assets/images/community1.png",
    "assets/images/community1.png",
    "assets/images/community1.png",
  ];
  var indexCarousel = 0.obs;
  void changeIndexCarousel(int index) {
    indexCarousel.value = index;
  }
}
