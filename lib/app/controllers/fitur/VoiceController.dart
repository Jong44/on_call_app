import 'dart:async';

import 'package:android_intent_plus/android_intent.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceController extends GetxController {
  late stt.SpeechToText _speech;
  var command = ''.obs;
  var isListening = false.obs;
  Timer? timer;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    _speech = stt.SpeechToText();
    startContinuousCheck();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _speech.stop();
  }

  void startContinuousCheck() {
    // Timer untuk melakukan pengecekan setiap 5 detik
    timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      print("Checking for background trigger...");
      if (prefs.getBool('changePageTriggered') == true) {
        await checkForBackgroundTrigger();
      }
    });
  }

  Future<void> checkForBackgroundTrigger() async {
    bool? changePageTriggered = prefs.getBool('changePageTriggered');
    print("Change page triggered: $changePageTriggered");
    if (changePageTriggered != null && changePageTriggered == true) {
      // Jika trigger ditemukan, lakukan navigasi atau tindakan lain
      print("Change page trigger detected, navigating...");

      // await startListening();
    }
  }

  Future<void> startListening() async {
    if (!isListening.value) {
      bool available = await _speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onError: $val'));
      if (available) {
        isListening.value = true;
        _speech.listen(
          onResult: (result) => {
            print('onResult: ${result.recognizedWords}'),
            command.value = result.recognizedWords,
            trigger(),
          },
        );
      }
    } else {
      _speech.stop();
      isListening.value = false;
    }
  }

  void trigger() async {
    if (command.value.toLowerCase().contains("athena")) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: Uri.parse('myapp://open').toString(),
        package:
            'com.example.one_call_app', // replace com.example.one_call_app with your package name
      );

      try {
        await intent.launch();
      } catch (e) {
        print('Error launching app: $e');
      }
      Get.toNamed('/emergency-detail');
    } else if (command.value.toLowerCase().contains("athena")) {
      Get.toNamed('/emergency-detail');
    } else {
      command.value = '';
    }
  }
}
