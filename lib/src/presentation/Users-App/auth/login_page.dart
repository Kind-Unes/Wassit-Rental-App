import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/auth/widgets/custom_triangle_painter.dart';
import 'package:wassit_cars_rental_app/src/widgets/primary_button.dart';
import 'package:wassit_cars_rental_app/src/widgets/text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogging = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      body: Stack(
        children: [
          Positioned(
            top: 20.h,
            right: 0,
            left: 0,
            child: Center(
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset(
                  "assets/logo/logo.png",
                  color: Colors.white,
                  height: 220,
                  width: 220,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              children: [
                Column(
                  children: [
                    Transform.scale(
                      scaleX: 1.1,
                      child: TriangleWidget(
                        size: Size(context.width, context.height / 5),
                      ),
                    ),
                    Container(
                      width: context.width,
                      height: context.height / 1.9,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 30, 30, 30)),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    width: context.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(30.h),
                        CustomTextField(
                          isPassword: false,
                          controller: emailController,
                          label: 'Email',
                          icon: Icons.email,
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        Gap(20.h),
                        CustomTextField(
                          isPassword: true,
                          controller: passwordController,
                          maxLines: 1,
                          label: 'Password',
                          icon: Icons.email,
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        Gap(20.h),
                        CustomTextField(
                          isPassword: true,
                          controller: passwordController,
                          maxLines: 1,
                          label: 'Password',
                          icon: Icons.email,
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        Gap(10.h),
                        // forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Gap(50.h),
                        PrimaryButton(
                            color: Colors.orangeAccent,
                            title: "Log In",
                            onTap: () {},
                            borderRaduis: 8,
                            fontColor: Colors.black),

                        Gap(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Gap(10.w),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Gap(20.h),
                      ],
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

//   login(BuildContext myContext) async {
//     setState(() {
//       isLogging = true;
//     });

//     // Quick controllers verification
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       toast.error(myContext, "Login failed", "Please fill all required feilds");
//       setState(() {
//         isLogging = false;
//       });
//       return;
//     }

//     final result = await auth.signInWithEmailAndPassword(
//         email: emailController.text, password: passwordController.text);

//     final String usedEmail = await prefrences.readIsSingleMailSteps();

//     if (usedEmail == emailController.text.trim() || usedEmail.trim().isEmpty) {
//       await prefrences.writeIsSingleMailSteps(emailController.text.trim());
//     } else {
//       toast.error(context, "Error",
//           "pcan only have a single account in each Device!, Please log into $usedEmail account.");
//       setState(() {
//         isLogging = false;
//       });
//       return;
//     }

//     result.fold((l) async {
//       if (!auth.currentUser!.emailVerified) {
//         toast.warning(myContext, "Please Verify your email to continue");

//         myContext.push(AppRoutes.verifyMail);
//       } else {
//         // verify the subscription
//         final userData = await firestore
//             .collection("users")
//             .doc(auth.currentUser!.uid)
//             .get()
//             .then((value) => value.data());

//         bool isSubscribed = isDate1Bigger(
//             DateTime.tryParse(userData!["subscriptionEnds"]!)!, DateTime.now());
//         if (!isSubscribed) {
//           myContext.push(AppRoutes.subscription);
//         } else {
//           toast.success(myContext, "Welcome Back!");

//           // fetch user data to the local storage
//           final userModel = UserModel.fromJson(userData);

//           await prefrences.writeUserModel(userModel);

//           myContext.push(AppRoutes.home);
//         }
//       }
//     }, (r) {
//       toast.error(context, "Login Failed", r.message);
//     });

//     setState(() {
//       isLogging = false;
//     });
//   }
}
