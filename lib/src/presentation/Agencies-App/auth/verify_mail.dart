import 'dart:async';

import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/injection_container.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/agency_auth_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/home/home_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen>
    with SingleTickerProviderStateMixin {
  //*
  late TabController _tabController;
  int selectedIndex = 0;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isLogging = false;
  bool isRegistering = false;

  late Timer _functionTimer;
  late Timer _timer;
  int _seconds = 20; // Initial timer duration in seconds
  bool _timerRunning = true;
  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);

    if (mounted) {
      _startTimer();
      auth.currentUser!.sendEmailVerification();
      verifiyUser();
    }
  }

  void verifiyUser() {
    _functionTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (mounted && !_isEmailVerified) {
        await auth.currentUser!.reload();
        if (auth.currentUser!.emailVerified && mounted) {
          _isEmailVerified = true;
          _functionTimer.cancel();
          context.pushReplacement(const HomeScreen());
        }
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
          _timerRunning = false;
        }
      });
    });
    _timerRunning = true;
  }

  void _restartTimer() {
    _timer.cancel();
    _seconds = 20;
    _startTimer();
  }

  @override
  void dispose() {
    _functionTimer.cancel();
    _timer.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor2,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: BottomRoundedClipper(),
                child: Container(
                  height: context.height * 0.73,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 253, 191, 109),
                      Color(0xFfFF7E01),
                    ],
                  )),
                  child: Column(
                    children: [
                      Gap(40.h),
                      Transform.scale(
                        scale: 0.5,
                        child: Image.asset(
                          "assets/logo/logo.PNG",
                          color: Colors.white,
                          //
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 210.h,
            right: 0,
            left: 0,
            child: Container(
                padding: EdgeInsets.only(bottom: 20.h),
                width: context.width,
                margin: EdgeInsets.only(
                  right: 30.w,
                  left: 30.w,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    color: const Color.fromARGB(255, 244, 245, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.15),
                        offset: const Offset(0, 5),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        controller: _tabController,
                        unselectedLabelStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.3),
                          fontSize: 16,
                          letterSpacing: 1.7,
                          fontWeight: FontWeight.bold,
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.7,
                            fontSize: 16,
                            color: const Color(0xFfFF7E01).withOpacity(0.7)),
                        dividerColor: const Color(0xFfFF7E01).withOpacity(0.6),
                        dividerHeight: 0.63,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                          loginEmailController.clear();
                          loginPasswordController.clear();
                          registerEmailController.clear();
                          registerPasswordController.clear();
                          nameController.clear();
                        },
                        indicatorColor: const Color(0xFfFF7E01),
                        tabs: const [
                          // text: "AppLocalizations.of(context)!.login",
                          Tab(text: "Verify Email Address"),
                        ],
                      ),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Gap(50.h),
                        //welocme back
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            "We have sent a verification email to your email address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Gap(30.h),
                        PrimaryButton(
                          onPressed: _timerRunning
                              ? null
                              : () {
                                  if (!_timerRunning) {
                                    _restartTimer();
                                    auth.currentUser!.sendEmailVerification();
                                  }
                                },
                          title: _timerRunning
                              ? "Check your email"
                              : "Send Verification Mail",
                        ),
                        Gap(20.h),

                        Container(
                          width: 85.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orange.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _seconds.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.orange.withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Icon(
                                  Icons.timer_sharp,
                                  color: Colors.orange.withOpacity(0.7),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(10.w),
                            InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Text(
                                "GO BACK",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ])
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
