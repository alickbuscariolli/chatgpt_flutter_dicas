import 'package:dio/dio.dart';

import '../core/app_config.dart';

class ChatGPTRepository {
  final Dio _dio;

  ChatGPTRepository(Dio dio) : _dio = dio;

  Future<String> promptMessage(String prompt) async {
    try {
      const url = "https://api.openai.com/v1/completions";

      final response = await _dio.post(url,
          data: {
            'model': 'text-davinci-003',
            'prompt': prompt,
            'temperature': 0,
            'max_tokens': 1000,
            'top_p': 1,
            'frequency_penalty': 0.0,
            'presence_penalty': 0.0
          },
          options: Options(headers: {
            'Authorization': 'Bearer ${AppConfig.getOpenAIAPIKey}',
          }));

      return response.data['choices'][0]['text'];
    } catch (_) {
      return 'Ocorreu um erro! Por favor, tente novamente';
    }
  }
}
