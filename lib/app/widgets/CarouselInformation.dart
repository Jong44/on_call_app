import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/controllers/main/InformationController.dart';

class CarouselInformation extends StatelessWidget {
  final InformationController informationController;
  const CarouselInformation({super.key, required this.informationController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              informationController.changeIndexCarousel(index);
            },
          ),
          items: List.generate(
            informationController.corouselList.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    informationController.corouselList[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: ColorConfig.primaryColor200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
                children: List.generate(
              informationController.corouselList.length,
              (index) => Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: informationController.indexCarousel.value == index
                      ? 16
                      : 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: informationController.indexCarousel.value == index
                          ? Colors.white
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            )),
          ),
        ),
      ],
    );
  }
}
