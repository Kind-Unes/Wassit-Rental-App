// import 'dart:convert';
// import 'dart:developer';

// import 'package:wassit_cars_rental_app/src/core/app_const.dart';
// import 'package:http/http.dart' as http;

// class HTTPSerivce {
//   static const String baseURL = AppConsts.baseURL;

//   static const String quranCloud = "https://verses.quran.com/";

//   //
//   static const String ayaAudioByVerse = "api/v4/recitations/3/by_ayah/";
//   static const String audioPage = "api/v4/recitations/3/by_page/";
//   static const String translation = "api/v4/quran/translations/85?verse_key=";
//   static const String tafsir = "api/v4/quran/tafsirs/";

//   //
//   Future fetchAyaRecitation(
//       {required int surahNumber, required int ayaNumber}) async {
//     const String url = "$baseURL$ayaAudioByVerse$surahNumber:$ayaNumber";
//     //v4/recitations/3/by_ayah/2:1
//     log(url);
//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         log(data.toString());
//         String audioUrl = data["audio_files"][0]["url"];
//         return "$quranCloud$audioUrl";
//       } else {
//         log(response.statusCode.toString());
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future fetchPageRecitation({required int pageNumber}) async {
//     const String url = "$baseURL$audioPage$pageNumber";
//     //v4/recitations/3/by_ayah/2:1
//     log(url);
//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         log(data.toString());

//         // 177

//         List listOfAudio = [];
//         for (int i = 0; i < data["audio_files"].length; i++) {
//           String audioUrl = data["audio_files"][i]["url"];
//           listOfAudio.add(audioUrl);
//         }

//         return listOfAudio;
//       } else {
//         log(response.statusCode.toString());
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future fetchAyaTranslation(
//       {required int surahNumber, required int ayaNumber}) async {
//     //
//     const String url = "$baseURL$translation$surahNumber:$ayaNumber";

//     log(url);
//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         return data;
//       } else {
//         log(response.statusCode.toString());
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future fetchAyaTafsir(
//       {required int surahNumber,
//       required int ayaNumber,
//       required int typeOfTafsir}) async {
//     //

//     try {
//       final response = await http.get(Uri.parse(
//           "http://api.quran-tafseer.com/tafseer/$typeOfTafsir/$surahNumber/$ayaNumber"));

//       log("http://api.quran-tafseer.com/tafseer/$typeOfTafsir/$surahNumber/$ayaNumber");

//       if (response.statusCode == 200) {
//         final decodedResponse = utf8.decode(response.bodyBytes);
//         final data = jsonDecode(decodedResponse);

//         log(data.toString());

//         final mytafsir = data["text"];

//         return mytafsir;
//       } else {
//         log(response.statusCode.toString());
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
