import 'package:voca_do/core/config/env/env.dart';
import 'package:voca_do/core/network/api_endpoints.dart';
import 'package:voca_do/core/network/dio_client.dart';

extension GeminiMethods on DioClient {
  Future<String> getJson(String task) async {
    // ==============================================================
    final String endpoint =
        '/${ApiEndpoints.apiVersion}/models/${ApiEndpoints.model}:${ApiEndpoints.action}?key=${Env.geminiApiKey}';
    // ==============================================================

    final String prompt =
        ("You are a specialized data extraction assistant. Your task is to parse raw administrative text and extract specific entities into a strict JSON format. "
        "### Extraction Rules: "
        "1. **task**: The specific action or project described. "
        "2. **assignee**: The person responsible for the task. "
        "3. **due_date**: The deadline. Convert all dates to 'YYYY-MM-DD' format. If a relative date is used (e.g., 'tomorrow'), calculate it based on today's date: 2026-04-25. "
        "4. **Null Values**: If a field is missing, set its value to null (without quotes). "
        "### Output Format: "
        "Return ONLY a valid JSON object. Do not include markdown code blocks, explanations, or preamble. "
        "### Examples: "
        "Text: 'Khalid, please finish the report by Friday.' "
        "Output: {\"task\": \"finish the report\", \"assignee\": \"Khalid\", \"due_date\": \"2026-05-01\"} "
        "Text: 'Need to fix the server bug.' "
        "Output: {\"task\": \"fix the server bug\", \"assignee\": null, \"due_date\": null} "
        "### Input Text: $task");

    // ==============================================================

    final Map<String, dynamic> payload = {
      "contents": [
        {
          "parts": [
            {"text": prompt},
          ],
        },
      ],
      // Force JSON response
      "generationConfig": {"response_mime_type": "application/json"},
    };

    // ==============================================================

    // POST request to Gemini API
    final geminiResponse = await dio.post(endpoint, data: payload);

    // ==============================================================

    final responseData = geminiResponse.data;

    // Extract the text from geminiResponse
    final String generatedText =
        responseData['candidates'][0]['content']['parts'][0]['text'];

    // ==============================================================

    return generatedText;
  }
}
