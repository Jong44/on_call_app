import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceController extends GetxController {
  late stt.SpeechToText _speech;
  var command = ''.obs;
  var isListening = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _speech = stt.SpeechToText();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _speech.stop();
  }

  void startListening() async {
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
            trigger(result.recognizedWords),
          },
        );
      }
    } else {
      _speech.stop();
      isListening.value = false;
    }
  }

  void trigger(String command) {
    if (command.toLowerCase().contains("athena")) {
      Get.toNamed('/emergency-detail');
    } else if (command.toLowerCase().contains("athena")) {
      Get.toNamed('/emergency-detail');
    }
  }
}
