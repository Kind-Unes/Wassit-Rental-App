import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:wassit_cars_rental_app/src/core/font_family.dart';

class ToastsHelper {
  void success(BuildContext context, String title) {
    CherryToast.success(
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontFamily: arabic,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      animationType: AnimationType.fromRight,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  void info(BuildContext context, String title, String desc) {
    CherryToast.info(
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontFamily: arabic,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      description: Text(
        desc,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontFamily: arabic,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      animationType: AnimationType.fromRight,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  void warning(
    BuildContext context,
    String description,
  ) {
    CherryToast.warning(
      description: Text(
        description,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontFamily: arabic,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      animationType: AnimationType.fromRight,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }

  void error(BuildContext context, String title, String description) {
    CherryToast.error(
      description: Text(
        description,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontFamily: arabic,
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.7)),
      ),
      title: Text(
        title,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontFamily: arabic,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      animationType: AnimationType.fromRight,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }
}
