import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/fitur/VoiceController.dart';
import 'package:one_call_app/app/controllers/main/InformationController.dart';
import 'package:one_call_app/app/widgets/CardInformation.dart';
import 'package:one_call_app/app/widgets/CarouselInformation.dart';
import 'package:one_call_app/app/widgets/SearchBar.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VoiceController voiceController = Get.put(VoiceController());
    final InformationController informationController =
        Get.put(InformationController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SearchBars(
                  onChanged: (value) {},
                  hintText: "Cari Informasi",
                ),
                const SizedBox(height: 20),
                CarouselInformation(
                  informationController: informationController,
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: const CardInformation(
                        title: "Community",
                        description: "Community Description",
                        category: "Community",
                        image: "assets/images/community1.jpg",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
