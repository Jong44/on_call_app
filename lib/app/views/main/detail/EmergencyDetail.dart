import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/main/MapController.dart';
import 'package:one_call_app/app/widgets/CircleEmergency.dart';

class EmergencyDetail extends StatelessWidget {
  const EmergencyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.put(MapController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Panggilan Terdekat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mohon bersiap-siap, kami sedang meminta bantuan. Kontak darurat Anda dan layanan penyelamatan terdekat akan melihat permintaan bantuan Anda ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 130),
                CircleEmergency(
                  isShowText: false,
                  minRadius: 75,
                  onTapDown: () {},
                  onTapCancel: () {},
                  onTapUp: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
