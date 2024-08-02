import 'dart:async';

import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/agency_auth_screen.dart';
import 'package:wassit_cars_rental_app/src/widgets/text_feild.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswrodState();
}

class _ForgotPasswrodState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  TextEditingController emailController = TextEditingController();

  bool isSending = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor2,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Center(
          //   child: Expanded(
          //     child: Transform.scale(
          //       scaleY: 2,
          //       child: Container(
          //         width: 120.w,
          //         decoration: const BoxDecoration(
          //           color: Color.fromARGB(255, 25, 107, 250),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            child: Column(
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
          ),

          Center(
              child: Container(
                  height: selectedIndex == 0
                      ? context.height * 0.47
                      : context.height * 0.5,
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
                          color: Colors.blue.withOpacity(0.15),
                          offset: const Offset(0, 5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          unselectedLabelStyle: TextStyle(
                            color: Colors.blue.withOpacity(0.3),
                            fontSize: 16,
                            letterSpacing: 1.7,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.7,
                              fontSize: 16,
                              color: Color.fromARGB(255, 26, 146, 245)),
                          dividerColor: Colors.blue.withOpacity(0.3),
                          dividerHeight: 0.63,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          indicatorColor: Colors.blue,
                          tabs: const [
                            // text: "AppLocalizations.of(context)!.login",
                            Tab(
                                text:
                                    "AppLocalizations.of(context)!.resetPassword"),
                          ],
                        ),
                        Column(children: [
                          Gap(50.h),
                          Text(
                            //  forgot password title
                            "AppLocalizations.of(context)!.writeEmailAddress",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gap(30.h),
                          CustomTextField(
                              label:
                                  "AppLocalizations.of(context)!.emailAddress",
                              icon: Icons.email,
                              controller: emailController,
                              isPassword: false,
                              keyBoardType: TextInputType.emailAddress),
                          Gap(0.h),
                          PrimaryButton(
                            onPressed: () async {
                              await sendRestLink(context);
                            },
                            title: isSending
                                ? "AppLocalizations.of(context)!.pleaseWait"
                                : "AppLocalizations.of(context)!.sendResetLink",
                          ),
                          Gap(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Gap(10.w),
                              InkWell(
                                onTap: () {
                                  // context.go(AppRoutes.login);
                                  context.pop();
                                },
                                child: Text(
                                  "AppLocalizations.of(context)!.goBack",
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
                  )))
        ],
      ),
    );
  }

  Future sendRestLink(BuildContext context) async {
    if (emailController.text.isEmpty) {
      toast.error(
        context,
        "AppLocalizations.of(context)!.error",
      );
      return;
    }

    setState(() {
      isSending = true;
    });
    try {
      auth.instance.sendPasswordResetEmail(email: emailController.text.trim());

      toast.success(
          context, "AppLocalizations.of(context)!.resetLinkSentToYourEmail");
    } on FirebaseAuthException catch (e) {
      toast.error(context, e.message!);
    }
    setState(() {
      isSending = false;
    });
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.15),
              offset: const Offset(0, 4),
              spreadRadius: 0.5,
              blurRadius: 5,
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 86, 176, 250),
              Color.fromARGB(255, 14, 102, 254),
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 25,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
