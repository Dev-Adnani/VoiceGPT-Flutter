import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voicegpt/app/constants/app.keys.dart';
import 'package:voicegpt/app/routes/api.routes.dart';

class OpenAI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "test"
  };
  static const apiKey = AppKeys.apiKey;
  var url = Uri.https("api.openai.com", "/v1/completions");

  Future generateText(String prompt) async {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseJson;
    } else {
      return;
    }
  }
}
