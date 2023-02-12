import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechNotifier with ChangeNotifier {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListenting = false;
  bool get getIsListening => _isListenting;
  String _textSpeech = "Press the button to start speech";
  String get getTextSpeech => _textSpeech;

  void onListen() async {
    bool avail = await _speechToText.initialize();
    notifyListeners();

    if (avail) {
      _isListenting = true;
      _speechToText.listen(onResult: (val) {
        _textSpeech = val.recognizedWords;
        notifyListeners();
      });
    } else {
      _isListenting = false;
      _speechToText.stop();
      notifyListeners();
    }
  }
}
