import 'package:get/get.dart';

class InformationController extends GetxController {
  List corouselList = [
    "assets/images/community1.jpg",
    "assets/images/community2.jpg",
    "assets/images/community3.jpg",
    "assets/images/community4.jpg",
    "assets/images/community5.jpg",
  ];
  var indexCarousel = 0.obs;
  void changeIndexCarousel(int index) {
    indexCarousel.value = index;
  }
}
