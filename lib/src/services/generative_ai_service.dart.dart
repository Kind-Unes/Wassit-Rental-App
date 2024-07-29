// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class GeminiController {
//   //* Text Model Configurations
//   static final generationConfig = GenerationConfig(
//     stopSequences: ["red"],
//     maxOutputTokens: 200,
//     temperature: 0.9,
//     topP: 0.1,
//     topK: 16,
//   );

//   static final safetySettings = [
//     // SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
//     // SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
//     // SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
//     // SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
//     // SafetySetting(HarmCategory.unspecified, HarmBlockThreshold.none),
//   ];

//   //* Text Model Definition
//   static final model = GenerativeModel(
//     model: 'gemini-pro',
//     apiKey: dotenv.env['GEMINI_API_KEY']!,
//     generationConfig: generationConfig,
//     // safetySettings: safetySettings
//   );

//   //* Text Model History
//   final chat = model.startChat(history: [
//     Content.text(
//         'Your name is Doctor Osler.Ai, and you are a medical professional for a mobile fitness app (pedometer steps counter), you have to give advice to users depending on the questions about fitness and health. You are a friendly and helpful AI.'),
//     Content.model([TextPart('Great to meet you. What would you like to know?')])
//   ]);

//   //* Text Model Methods

//   Future<String?> generateText(String prompt) async {
//     final content = Content.text(prompt);
//     final response = await chat.sendMessage(content);
//     return response.text;
//   }
// }
