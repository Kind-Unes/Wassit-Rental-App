// // ignore_for_file: use_build_context_synchronously

// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';


// class VerifyMailPage extends StatefulWidget {
//   const VerifyMailPage({super.key});

//   @override
//   State<VerifyMailPage> createState() => _VerifyMailPageState();
// }

// class _VerifyMailPageState extends State<VerifyMailPage> {
//   // timer
//   late Timer _functionTimer;
//   late Timer _timer;
//   int _seconds = 20; // Initial timer duration in seconds
//   bool _timerRunning = true;

//   @override
//   void initState() {
//     super.initState();

//     if (mounted) {
//       _startTimer();
//       // auth.currentUser!.sendEmailVerification();
//       verifiyUser();
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   verifiyUser() async {
//     _functionTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       log("hi");
//       if (mounted) {
//         // await auth.currentUser!.reload();

//         if (auth.currentUser!.emailVerified) {
//           final userCount = await firestore.collection("users").count().get();

//           final userModel = UserModel(
//             subscriptionEnds: DateTime.now(),
//             subscriptionPlan: "",
//             id: auth.currentUser!.uid,
//             totalDistances: 0,
//             iban: '',
//             totalSteps: 0,
//             totalCalories: 0,
//             totalTime: 0,
//             totalMoneyEarned: 0,
//             imageUrl:
//                 "https://e7.pngegg.com/pngimages/753/432/png-clipart-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service.png",
//             email: auth.currentUser!.email!,
//             gender: Gender.male,
//             weight: 70,
//             height: 170,
//             joinDate: DateTime.now(),
//             firstName: 'User ${userCount.count}',
//             secondName: '',
//             isOwner: false,
//             adminRequestsIds: [],
//             isAdmin: false,
//             adminJob: '',
//             didSeeNotifications: true,
//             paypalEmailAdress: "",
//             accountHolderName: "",
//             bankName: "",
//             accountNumber: "",
//             bankRoutingNumberSortCode: "",
//             swiftBicCode: "",
//             dailyGoal: 500,
//           );

//           await firestore
//               .collection("users")
//               .doc(auth.currentUser!.uid)
//               .set(userModel.toJson());

//           await prefrences.writeUserModel(userModel);

//           context.pushReplacement(AppRoutes.subscriptionRegistering);
//         }
//       }
//     });
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_seconds > 0) {
//           _seconds--;
//         } else {
//           _timer.cancel();
//           _timerRunning = false;
//         }
//       });
//     });
//     _timerRunning = true;
//   }

//   void _restartTimer() {
//     _timer.cancel();
//     _seconds = 20;
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _functionTimer.cancel();
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 38, 38, 38),
//       body: Stack(
//         children: [
//           Transform.scale(
//               scale: 0.7, child: Image.asset("assets/logo/logo.png")),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Transform.scale(
//                     scaleX: 1.1,
//                     child: TriangleWidget(
//                       size: Size(context.width, context.height / 5),
//                     ),
//                   ),
//                   Container(
//                     width: context.width,
//                     height: context.height / 1.9,
//                     decoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 30, 30, 30)),
//                     child: Transform.translate(
//                       offset: Offset(0, -30.h),
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 40.w),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Email Verification",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 28.sp,
//                                     fontFamily: fontFamily,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Gap(30.h),
//                               //
//                               Text(
//                                   "We sent you a link to verify your email address, please check your email and click on the link to verify your email address.",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14.sp,
//                                       fontFamily: fontFamily,
//                                       fontWeight: FontWeight.w500)),

//                               Gap(40.h),
//                               PrimaryButton(
//                                   text: _timerRunning
//                                       ? "Check your Email Inbox"
//                                       : "Send Verification mail",
//                                   onTap: _timerRunning
//                                       ? null
//                                       : () {
//                                           if (!_timerRunning) {
//                                             _restartTimer();
//                                             auth.currentUser!
//                                                 .sendEmailVerification();
//                                           }
//                                         }),
//                               Gap(20.h),
//                               // advanced ui timer
//                               Container(
//                                 width: 85.w,
//                                 height: 40.h,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color:
//                                       AppColors.primaryColor.withOpacity(0.2),
//                                 ),
//                                 child: Center(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         _seconds.toString(),
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                           color: AppColors.primaryColor
//                                               .withOpacity(0.7),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 3.w,
//                                       ),
//                                       Icon(
//                                         Icons.timer_sharp,
//                                         color: AppColors.primaryColor
//                                             .withOpacity(0.7),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Gap(30.h),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Gap(10.w),
//                                   InkWell(
//                                     onTap: () {
//                                       context.go(AppRoutes.login);
//                                     },
//                                     child: Text(
//                                       "Go Back",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 20.sp,
//                                           fontFamily: fontFamily,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
