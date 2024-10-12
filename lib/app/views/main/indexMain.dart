import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/controllers/main/IndexMainController.dart';

class IndexMain extends StatelessWidget {
  const IndexMain({super.key});

  @override
  Widget build(BuildContext context) {
    final IndexMainController controller = Get.find();
    List menuList = [
      {
        'icon': Iconsax.home,
        'iconActive': Iconsax.home5,
        'title': 'Beranda',
      },
      {
        'icon': Iconsax.keyboard,
        'iconActive': Iconsax.keyboard5,
        'title': 'Kontak',
      },
      {
        'size': 40,
      },
      {
        'icon': Iconsax.element_3,
        'iconActive': Iconsax.element_35,
        'title': 'Informasi',
      },
      {
        'icon': Icons.person_2_outlined,
        'iconActive': Icons.person_2,
        'title': 'Profil',
      },
    ];
    return Scaffold(
        body: Obx(() {
          return controller.pages[controller.currentIndex.value];
        }),
        floatingActionButton: Transform.rotate(
          angle: 2.3,
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: ColorConfig.primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Transform.rotate(
              angle: -2.3,
              child: const Text(
                '505',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
              children: List.generate(menuList.length, (index) {
            if (menuList[index]['size'] != null) {
              return Expanded(
                child: Container(),
              );
            }
            return Expanded(
              child: InkWell(onTap: () {
                controller.changeIndex(index);
              }, child: Obx(() {
                return Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        controller.currentIndex.value == index
                            ? menuList[index]['iconActive']
                            : menuList[index]['icon'],
                        size: 20,
                        color: controller.currentIndex.value == index
                            ? ColorConfig.primaryColor
                            : Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        menuList[index]['title'],
                        style: TextStyle(
                          color: controller.currentIndex.value == index
                              ? ColorConfig.primaryColor
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              })),
            );
          })),
        ));
  }
}
