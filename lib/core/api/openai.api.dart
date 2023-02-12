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

  Future generateText(String prompt) async {
    final response = await http.post(
      Uri.parse(ApiRoutes.apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: jsonEncode({
        "prompt": prompt,
        "max_tokens": 200,
        "temperature": 1,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      throw Exception("Failed to generate text");
    }
  }
}
