import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:voca_do/core/config/env/env.dart';
import 'package:voca_do/core/network/api_endpoints.dart';
import 'package:voca_do/core/network/dio_client.dart';

extension GeminiMethods on DioClient {
  Future<Map<String, dynamic>> getJson(String task) async {
    //@ ==========================================================

    final String apiKey = Env.geminiApiKey;
    final String endpoint =
        '/${ApiEndpoints.apiVersion}/models/${ApiEndpoints.model}:${ApiEndpoints.action}?key=$apiKey';

    //@ ==========================================================

    final String prompt =
        "You are a specialized data extraction assistant. Your task is to parse raw administrative text and extract specific entities into a strict JSON format. "
        "### Language Rule: "
        "The JSON keys MUST always be in English. However, the values for 'task' and 'assignee' MUST be in the same language as the input text (e.g., if the input is in Arabic, the values must be in Arabic; if English, values must be in English). "
        "### Extraction Rules: "
        "1. **task**: The specific action or project described. "
        "2. **assignee**: The person responsible for the task. "
        "3. **due_date**: The deadline in 'YYYY-MM-DD' format. If a relative date is used (e.g., 'tomorrow' or 'بكرة'), calculate it based on today's date: 2026-04-25. "
        "4. **Null Values**: If a field is missing, set its value to null. "
        "### Output Format: "
        "Return ONLY a valid JSON object. Do not include markdown code blocks or explanations. "
        "### Examples: "
        "Input: 'خالد، خلص التقرير يوم الجمعة' "
        "Output: {\"task\": \"خلص التقرير\", \"assignee\": \"خالد\", \"due_date\": \"2026-05-01\"} "
        "### Input Text: $task";

    //@ ==========================================================

    final Map<String, dynamic> payload = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {"text": prompt},
          ],
        },
      ],
      "generationConfig": {
        "temperature": 0.1,
        "responseMimeType": "application/json",
      },
    };

    //@ ==========================================================

    // POST request
    try {
      final geminiResponse = await dio.post(
        endpoint,
        queryParameters: {'key': Env.geminiApiKey},
        data: payload,
      );

      //@ ==========================================================

      final responseData = geminiResponse.data;
      final String rawJsonString =
          responseData['candidates'][0]['content']['parts'][0]['text'];

      //@ ==========================================================

      return jsonDecode(rawJsonString) as Map<String, dynamic>;
    } on DioException catch (e) {
      rethrow;
    }
  }
}
