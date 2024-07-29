import 'package:shared_preferences/shared_preferences.dart';

// todo : you can only have a single account in each device and when deletes the account the boolean get reversed
class SharedPrefrencesController {
  // //*Keys:
  // static const String _bookMarkPageKey = "bookMarkPage";
  // static const String _sabhaKey = "sabha";
  // static const String _wirdCurrentPageKey = "wirdPage";
  // static const String _wirdAmountKey = "wirdAmount";
  // static const String _wirdProgressKey = "_wirdProgress";
  // static const String _typeOfTafsirKey = "typeOfTafsirKey";

  // //*---------------------------------------------------------------------------*//
  // //* read bookMarkPage
  // Future<int> readbookMarkPage() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // happens one time
  //   if (prefs.getInt(_bookMarkPageKey) == null) {
  //     await prefs.setInt(_bookMarkPageKey, 1);
  //     return 1;
  //   }
  //   return prefs.getInt(_bookMarkPageKey)!;
  // }

  // //* write bookMarkPage
  // Future<bool> writebookMarkPage(int value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(_bookMarkPageKey, value);
  // }

  // //*---------------------------------------------------------------------------*//
  // //* read sabha
  // Future<int> readsabha() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // happens one time
  //   if (prefs.getInt(_sabhaKey) == null) {
  //     await prefs.setInt(_sabhaKey, 0);
  //     return 0;
  //   }
  //   return prefs.getInt(_sabhaKey)!;
  // }

  // //* write sabha
  // Future<bool> writesabha(int value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(_sabhaKey, value);
  // }

  // //*---------------------------------------------------------------------------*//

  // // value of 0 =====) amountPage
  // //* read WirdCurrentPage
  // Future<int> readWirdCurrentPage() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // happens one time
  //   if (prefs.getInt(_wirdCurrentPageKey) == null) {
  //     await prefs.setInt(_wirdCurrentPageKey, 0);
  //     return 0;
  //   }
  //   return prefs.getInt(_wirdCurrentPageKey)!;
  // }

  // //* write WirdCurrentPage
  // Future<bool> writeWirdCurrentPage(int value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(_wirdCurrentPageKey, value);
  // }

  // //*---------------------------------------------------------------------------*//
  // //* read WirdAmount
  // Future<int> readWirdAmount() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // happens one time
  //   if (prefs.getInt(_wirdAmountKey) == null) {
  //     await prefs.setInt(_wirdAmountKey, 10);
  //     return 10;
  //   }
  //   return prefs.getInt(_wirdAmountKey)!;
  // }

  // //* write WirdAmount
  // Future<bool> writeWirdAmount(int value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(_wirdAmountKey, value);
  // }
  // //*---------------------------------------------------------------------------*//

  // //* read wirdProgress
  // Future<int> readwirdProgress() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // happens one time
  //   if (prefs.getInt(_wirdProgressKey) == null) {
  //     await prefs.setInt(_wirdProgressKey, 1);
  //     return 1;
  //   }
  //   return prefs.getInt(_wirdProgressKey)!;
  // }

  // //* write wirdProgress
  // Future<bool> writewirdProgress(int value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(_wirdProgressKey, value);
  // }
  // //*---------------------------------------------------------------------------*//

  // //* read wirdProgress
  // Future<int> readTypeOfTafsir() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // happens one time
  //   if (prefs.getInt(_typeOfTafsirKey) == null) {
  //     await prefs.setInt(_typeOfTafsirKey, 4);
  //     return 4;
  //   }
  //   return prefs.getInt(_typeOfTafsirKey)!;
  // }

  // //* write TypeOfTafsir
  // Future<bool> writeTypeOfTafsir(int value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(_typeOfTafsirKey, value);
  // }
  // //*---------------------------------------------------------------------------*//

  // clearAll
  clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
