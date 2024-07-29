// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart' as sqlite;
// import 'package:sqflite/sqflite.dart';

// Future<void> copyDatabase() async {
//   ByteData data = await rootBundle.load(join('assets', 'quran.db'));
//   List<int> bytes =
//       data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

//   final Directory documentsDirectory = await getApplicationDocumentsDirectory();
//   final String dbPath = join(documentsDirectory.path, 'quran.db');

//   File dbFile = File(dbPath);
//   if (!await dbFile.exists()) {
//     await dbFile.writeAsBytes(bytes);
//   }
// }

// Future<Database> oopenDatabase() async {
//   await copyDatabase();

//   final Directory documentsDirectory = await getApplicationDocumentsDirectory();
//   final String dbPath = join(documentsDirectory.path, 'quran.db');
//   Database database = await sqlite.openDatabase(dbPath);
//   return database;
// }

// Future<List<Map<String, dynamic>>> queryByPageNumber(int pageNumber) async {
//   Database db = await oopenDatabase();
//   List<Map<String, dynamic>> result = await db.query(
//     'glyphs', // Replace with your actual table name
//     where: 'page_number = ?',
//     whereArgs: [pageNumber],
//   );
//   return result;
// }

// Future<List<Map<String, dynamic>>> fetchPageData(int pageNumber) async {
//   List<Map<String, dynamic>> queryResults = await queryByPageNumber(pageNumber);

//   List<Map<String, dynamic>> jsonResult = queryResults.map((row) {
//     return {
//       "page_number": row["page_number"],
//       "line_number": row["line_number"],
//       "sura_number": row["sura_number"],
//       "aya_number": row["ayah_number"],
//       "position": row["position"],
//       "min_x": row["min_x"],
//       "max_x": row["max_x"],
//       "min_y": row["min_y"],
//       "max_y": row["max_y"],
//     };
//   }).toList();

//   return jsonResult;
// }
