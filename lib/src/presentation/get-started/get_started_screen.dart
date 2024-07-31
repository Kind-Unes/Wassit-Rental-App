import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/auth/login_page.dart';
import 'package:wassit_cars_rental_app/src/widgets/primary_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Wassit",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  color: Colors.white),
            ),
          ),
          const Spacer(),
          Transform.translate(
            offset: Offset(0, -15.h),
            child: Transform.flip(
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/get-started-car.png",
                  width: 330.w,
                  height: 330.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -15.h),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(200000)),
                  ),
                  Gap(10.w),
                  Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200000)),
                  ),
                  Gap(10.w),
                  Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(200000)),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.15),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Gap(10.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.15),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      "Compare",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Gap(10.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.15),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      "Rental",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
          Gap(10.h),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Easy Way to Rental your Dream Car",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    Gap(10.h),
                    Text(
                      "By using the car, you can move quickly from one place to another in your daily life",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.5)),
                    ),
                  ])),
          Gap(20.h),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: PrimaryButton(
                // color: Colors.orange,
                color: Colors.white,
                title: 'Get Started',
                fontColor: Colors.black,
                onTap: () {
                  context.push(const LoginScreen());
                },
                borderRaduis: 200,
              )),
          const Spacer(
            flex: 1000,
          )
        ],
      ),
    );
  }
}
