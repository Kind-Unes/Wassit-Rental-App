// C:/Users/rog/Desktop/Freelance Projects/balagh/lib/src/presentation/screens/login

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/injection_container.dart';
import 'package:wassit_cars_rental_app/src/models/agency_model.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/verify_mail.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/home/home_screen.dart';
import 'package:wassit_cars_rental_app/src/widgets/text_feild.dart';

class AdminsAuthScreen extends StatefulWidget {
  const AdminsAuthScreen({super.key});

  @override
  State<AdminsAuthScreen> createState() => _AdminsAuthScreenState();
}

class _AdminsAuthScreenState extends State<AdminsAuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  // qsdkspQODJF LOMKQSDFJILGOMJQSDLMFGJLSDFM

  bool isLogging = false;
  bool isRegistering = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          SingleChildScrollView(
            child: Column(
              children: [
                Gap(200.h),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 30.h),
                    width: context.width,
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TabBar(
                              controller: _tabController,
                              unselectedLabelStyle: TextStyle(
                                color: Colors.orange.withOpacity(0.3),
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                  fontSize: 16,
                                  color: Color.fromARGB(174, 223, 112, 1)),
                              dividerColor: Colors.orange.withOpacity(0.3),
                              dividerHeight: 0.63,
                              onTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                                loginEmailController.clear();
                                loginPasswordController.clear();
                                registerPasswordController.clear();
                                registerConfirmPasswordController.clear();
                                registerEmailController.clear();
                              },
                              indicatorColor: Colors.orange,
                              tabs: const [
                                Tab(text: "LOGIN"),
                                Tab(text: "REGISTER"),
                              ],
                            ),
                            if (selectedIndex == 0)
                              SingleChildScrollView(
                                child: Column(children: [
                                  Gap(15.h),
                                  Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(15.h),
                                  CustomTextField(
                                    label: "Email Address",
                                    icon: CupertinoIcons.mail_solid,
                                    isPassword: false,
                                    controller: loginEmailController,
                                    maxLines: 1,
                                    keyBoardType: TextInputType.emailAddress,
                                  ),
                                  CustomTextField(
                                    label: "Password",
                                    icon: CupertinoIcons.lock_fill,
                                    isPassword: true,
                                    maxLines: 1,
                                    controller: loginPasswordController,
                                    keyBoardType: TextInputType.visiblePassword,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        // context.push(const ForgotPasswordScreen());
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(20.h),
                                  PrimaryButton(
                                    title:
                                        isLogging ? "PLEASE WAIT ..." : "LOGIN",
                                    onPressed: () async {
                                      await login();
                                    },
                                  ),
                                ]),
                              )
                            else
                              SingleChildScrollView(
                                child: Column(children: [
                                  Gap(15.h),
                                  Text(
                                    "Regsiter Now",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(15.h),
                                  CustomTextField(
                                    label: "Email Address",
                                    icon: CupertinoIcons.person_solid,
                                    isPassword: false,
                                    maxLines: 1,
                                    controller: registerEmailController,
                                    keyBoardType: TextInputType.emailAddress,
                                  ),
                                  CustomTextField(
                                    label: "Password",
                                    icon: CupertinoIcons.mail_solid,
                                    isPassword: true,
                                    maxLines: 1,
                                    controller: registerPasswordController,
                                    keyBoardType: TextInputType.visiblePassword,
                                  ),
                                  CustomTextField(
                                    label: "Confirm Password",
                                    icon: CupertinoIcons.lock_fill,
                                    isPassword: true,
                                    maxLines: 1,
                                    controller:
                                        registerConfirmPasswordController,
                                    keyBoardType: TextInputType.visiblePassword,
                                  ),
                                  PrimaryButton(
                                    title: isRegistering
                                        ? "PLEASE WAIT ..."
                                        : "REGISTER",
                                    onPressed: () async =>
                                        isRegistering ? register() : register(),
                                  ),
                                ]),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  login() async {
    setState(() {
      isLogging = true;
    });

    // Quick controllers verification
    if (loginEmailController.text.isEmpty ||
        loginPasswordController.text.isEmpty) {
      toast.error(
        context,
        "Please fill all fields",
      );
      setState(() {
        isLogging = false;
      });
      return;
    }

    final result = await auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);

    result.fold((l) async {
      if (!(auth.currentUser!.emailVerified)) {
        toast.warning(context, "Please Verify Your Email Address Before");
        context.push(const VerifyEmailScreen());
      } else {
        toast.success(
          context,
          "Welcome Back",
        );
        context.push(const HomeScreen());
      }
    }, (r) {
      toast.error(context, r.message);
    });

    setState(() {
      isLogging = false;
    });
  }

  Future register() async {
    setState(() {
      isRegistering = true;
    });

    //! handle verification

    log(registerPasswordController.text);
    log(registerConfirmPasswordController.text);
    log(loginEmailController.text);

    if (registerPasswordController.text.trim().isEmpty ||
        registerConfirmPasswordController.text.trim().isEmpty ||
        registerEmailController.text.trim().isEmpty) {
      toast.error(context, "Please fill all fields");

      setState(() {
        isRegistering = false;
      });

      return;
    } else if (registerPasswordController.text.trim() !=
        registerConfirmPasswordController.text.trim()) {
      toast.error(context, "Passwords do not match");
      setState(() {
        isRegistering = false;
      });

      return;
    } else if (registerConfirmPasswordController.text.trim().length < 6) {
      toast.error(context, "Password must be at least 6 characters");
      setState(() {
        isRegistering = false;
      });

      return;
    }

    //* Start

    final result = await auth.createUserUsingEmailAndPassword(
        email: registerEmailController.text.trim(),
        password: registerConfirmPasswordController.text.trim());

    result.fold((l) async {
      final AgencyModel agencyModel = AgencyModel(
          didFinishAuth: false,
          id: auth.currentUser!.uid,
          notificationToken: "",
          email: registerEmailController.text.trim(),
          password: registerConfirmPasswordController.text.trim(),
          wilaya: "",
          city: "",
          name: "",
          lowerCaseName: "",
          ownerName: "",
          imageUrl:
              'https://e7.pngegg.com/pngimages/753/432/png-clipart-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service.png',
          phoneNumber: "",
          addedAt: DateTime.now(),
          updatedAt: DateTime.now(),
          beginDate: DateTime.now(),
          isActivated: false);
      await firestore
          .collection("agencies")
          .doc(auth.currentUser!.uid)
          .set(agencyModel.toJson());

      toast.success(context, "Agency created successfully!");
      context.push(const VerifyEmailScreen());
    }, (r) {
      toast.error(context, r.message);
    });

    //* End

    setState(() {
      isRegistering = false;
    });
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
              color: Colors.orange.withOpacity(0.15),
              offset: const Offset(0, 4),
              spreadRadius: 0.5,
              blurRadius: 5,
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 253, 191, 109),
              Color(0xFfFF7E01),
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
