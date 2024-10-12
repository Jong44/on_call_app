import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/fitur/VoiceController.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VoiceController controller = Get.put(VoiceController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.startListening();
        },
        child: const Icon(Icons.mic),
      ),
      body: Center(child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Press the button to start listening'),
            const SizedBox(height: 20),
            Text('Is Listening:${controller.isListening}'),
            Text('The result:${controller.command}'),
          ],
        );
      })),
    );
  }
}
