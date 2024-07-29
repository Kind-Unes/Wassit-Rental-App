import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/auth/widgets/custom_triangle_painter.dart';
import 'package:wassit_cars_rental_app/src/widgets/text_feild.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isRegistering = false;
  late String response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      body: Stack(
        children: [
          Transform.scale(
              scale: 0.7,
              child: Image.asset(
                "assets/logo/logo.png",
                color: Colors.white,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
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
                    child: Transform.translate(
                      offset: Offset(0, -70.h),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
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
                                label: '',
                                icon: Icons.email,
                                keyBoardType: TextInputType.visiblePassword,
                              ),
                              CustomTextField(
                                isPassword: false,
                                controller: emailController,
                                label: '',
                                icon: Icons.email,
                                keyBoardType: TextInputType.visiblePassword,
                              ),
                              Gap(10.h),
                              CustomTextField(
                                isPassword: false,
                                controller: emailController,
                                label: '',
                                icon: Icons.email,
                                keyBoardType: TextInputType.visiblePassword,
                              ),
                              Gap(40.h),
                              // PrimaryButton(
                              //     text: isRegistering
                              //         ? "Please Wait a moment .."
                              //         : "Register",
                              //     onTap: isRegistering
                              //         ? null
                              //         : () async {
                              //             await register();
                              //           }),
                              Gap(10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You already have an account?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Gap(10.w),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
//   }

//   Future register() async {
//     if (mounted) {
//       setState(() {
//         isRegistering = true;
//       });

//       //! handle verification
//       if (emailController.text.trim().isEmpty ||
//           passwordController.text.trim().isEmpty ||
//           confirmPasswordController.text.trim().isEmpty) {
//         toast.error(context, "MissingFeilds", "Please fill all the fields");
//         setState(() {
//           isRegistering = false;
//         });

//         return;
//       } else if (passwordController.text.trim().length < 6) {
//         toast.error(context, "Too Short Passowrd",
//             "Password must be at least 6 characters");
//         setState(() {
//           isRegistering = false;
//         });

//         return;
//       } else if (confirmPasswordController.text.trim() !=
//           passwordController.text.trim()) {
//         toast.error(context, "Passwords do not match",
//             "Please ensure that the passwords match");
//         setState(() {
//           isRegistering = false;
//         });

//         return;
//       }

//       //* Start

//       final result = await auth.createUserUsingEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());

//       result.fold((l) async {
//         final String doesHaveAnAccountAlready =
//             await prefrences.readIsSingleMailSteps();

//         if (doesHaveAnAccountAlready.isEmpty) {
//           toast.success(context, l.message);
//           await prefrences.writeIsSingleMailSteps(emailController.text.trim());
//           await auth.currentUser!.sendEmailVerification();
//           context.push(AppRoutes.verifyMail);
//         } else {
//           toast.error(context, "Error",
//               "You can only have a single account in each Device!, Please log into $doesHaveAnAccountAlready account.");
//         }
//       }, (r) {
//         toast.error(context, "Error Login", r.message);
//       });

//       //* End

//       setState(() {
//         isRegistering = false;
//       });
//     }
//   }
  }
}
