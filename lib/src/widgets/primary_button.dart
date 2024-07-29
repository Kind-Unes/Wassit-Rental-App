
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
    required this.borderRaduis,
    required this.fontColor,
  });

  final Color color;
  final Color fontColor;

  final String title;
  final Function() onTap;
  final double borderRaduis;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRaduis),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRaduis),
        child: Container(
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(borderRaduis)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}