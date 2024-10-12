import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_call_app/app/controllers/main/IndexMainController.dart';
import 'package:one_call_app/app/widgets/CircleEmergency.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final IndexMainController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        titleSpacing: 0,
        leading: Image.asset('assets/images/logo.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 13,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  'Lokasi Anda',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Obx(() {
              return Text(
                controller.address.value,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              );
            })
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Iconsax.notification5),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Apakah anda dalam keadaan darurat?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tekan tombol SOS, lokasi anda akan langsung dibagikan dengan pusat bantuan terdekat dan kontak darurat anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 80),
                Obx(() {
                  return CircleEmergency(
                    minRadius: controller.isPress.value ? 75 : 0,
                    onTapDown: () {
                      controller.isPress.value = true;
                      controller.startTimer();
                    },
                    onTapCancel: () {
                      controller.isPress.value = false;
                      controller.stopTimer();
                    },
                    onTapUp: () {
                      controller.isPress.value = false;
                      controller.stopTimer();
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
