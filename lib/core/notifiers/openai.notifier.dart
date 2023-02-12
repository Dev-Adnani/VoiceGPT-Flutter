import 'package:flutter/material.dart';
import 'package:voicegpt/core/api/openai.api.dart';
import 'package:voicegpt/core/models/response.model.dart';

class OpenAINotifier with ChangeNotifier {
  final OpenAI _openAI = OpenAI();

  bool check = false;
  bool get getCheck => check;
  List<Choice>? _data;
  List<Choice>? get getData => _data;

  Future getResponse({
    required String parameter,
    required BuildContext context,
  }) async {
    var userData = await _openAI.generateText(parameter);
    var response = ResponseModel.fromJson(userData);

    var received = response.choices;

    _data = received;
    check = true;

    notifyListeners();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
