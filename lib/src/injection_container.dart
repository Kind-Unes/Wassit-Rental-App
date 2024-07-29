// ignore: depend_on_referenced_packages
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:wassit_cars_rental_app/src/services/feedback_service.dart.dart';
import 'package:wassit_cars_rental_app/src/services/firebase_authentication_service.dart';
import 'package:wassit_cars_rental_app/src/services/firebase_storage_service.dart';
import 'package:wassit_cars_rental_app/src/services/share_service.dart';
import 'package:wassit_cars_rental_app/src/services/shared_prefrences_service.dart';
import 'package:wassit_cars_rental_app/src/utils/image_picker_cropper_helper.dart';
import 'package:wassit_cars_rental_app/src/utils/toasts.dart';

final locator = GetIt.instance;

void setUp() {
  // locator.registerSingleton<GeminiController>(GeminiController());
  locator.registerSingleton<AuthController>(AuthController());
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  locator.registerSingleton<FirebaseStorageService>(FirebaseStorageService());
  locator.registerSingleton<ToastsHelper>(ToastsHelper());
  locator.registerSingleton<FeedBackController>(FeedBackController());
  locator.registerSingleton<SharedPrefrencesController>(
      SharedPrefrencesController());
  locator.registerSingleton<ShareService>(ShareService());
  locator.registerSingleton<ImagePickerHelper>(ImagePickerHelper());
}

// final gemini = locator<GeminiController>();
final imagePicker = locator<ImagePickerHelper>();
final auth = locator<AuthController>();
final firestore = locator<FirebaseFirestore>();
final storage = locator<FirebaseStorageService>();
final toast = locator<ToastsHelper>();
final feedBack = locator<FeedBackController>();
final share = locator<ShareService>();
final prefrences = locator<SharedPrefrencesController>();
