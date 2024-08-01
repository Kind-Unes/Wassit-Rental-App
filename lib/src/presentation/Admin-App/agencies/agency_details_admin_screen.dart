import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/favorites/favorites_screen.dart';
import 'package:wassit_cars_rental_app/src/widgets/primary_button.dart';

class AgencyDetailsAdminScreen extends StatefulWidget {
  const AgencyDetailsAdminScreen({super.key});

  @override
  State<AgencyDetailsAdminScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AgencyDetailsAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
        },
        child: Scaffold(
            backgroundColor: AppColors.backgroundColor2,
            body: Column(
              children: [
                Gap(50.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyIconButton(
                        size: 45.sp,
                        color: Colors.white,
                        icon: FontAwesomeIcons.arrowLeft,
                        onTap: () {
                          context.pop();
                        },
                        iconSize: 15,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Agency Name",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(children: [
                              Gap(10.h),

                              Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(200.r)),
                              ),

                              Gap(10.h),
                              const Text(
                                "Agency Name",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),

                              Text(
                                "Joined at 23 Mars 2024",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              //
                              Gap(20.h),
                            ]),
                          ),

                          //? Profile Informations

                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(10.h),
                                Center(
                                  child: Container(
                                    width: 50.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.4),
                                        borderRadius:
                                            BorderRadius.circular(2000)),
                                  ),
                                ),
                                Gap(10.h),

                                const Text(
                                  "Common Features",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(10.h),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _profileElement(
                                        title: 'Show \nCars',
                                        icon: Icons.car_crash,
                                        onTap: () {},
                                        context: context),
                                    _profileElement(
                                        title: 'Show\nRentals',
                                        icon: Icons.car_rental,
                                        onTap: () {},
                                        context: context),
                                    _profileElement(
                                        title: 'Deactivate\nAgency',
                                        icon: Icons.delete_outline,
                                        onTap: () {
                                          _showChangePasswordBottomSheet(
                                              context);
                                        },
                                        context: context),
                                  ],
                                ),

                                Gap(10.h),

                                const Text(
                                  "Personal Informations",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),

                                Gap(10.h),
                                //? Name
                                _title("Full Name"),
                                ProfileTextFeild(
                                  title: 'YOUR FULL NAME',
                                  icon: FontAwesomeIcons.person,
                                  controller: TextEditingController(),
                                  keyBoardType: TextInputType.text,
                                  maxLines: 1,
                                  isPassword: false,
                                ),
                                Gap(15.h),
                                //? Name
                                _title("Email Address"),
                                ProfileTextFeild(
                                  title: 'YOUR EMAIL ADDRESS',
                                  icon: FontAwesomeIcons.envelope,
                                  controller: TextEditingController(),
                                  keyBoardType: TextInputType.text,
                                  maxLines: 1,
                                  isPassword: false,
                                  isEnabled: false,
                                ),
                                Gap(15.h),
                                //? Name
                                _title("Phone Number"),
                                ProfileTextFeild(
                                  title: 'YOUR PHONE NUMBER',
                                  icon: FontAwesomeIcons.phone,
                                  controller: TextEditingController(),
                                  keyBoardType: TextInputType.text,
                                  maxLines: 1,
                                  isPassword: false,
                                ),

                                Gap(30.h),
                                PrimaryButton(
                                  // color: Colors.orange,
                                  color: Colors.black,
                                  title: 'SAVE CHANGES',
                                  fontColor: Colors.white,
                                  onTap: () {},
                                  borderRaduis: 200,
                                ),
                                Gap(20.h),
                                const Center(
                                  child: Text(
                                    "DELETE AGENCY",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                                Gap(30.h),
                              ],
                            ),
                          ),

                          //
                        ]),
                  ),
                ),
              ],
            )));
  }

  Future<dynamic> _showChangePasswordBottomSheet(BuildContext context) {
    return showFlexibleBottomSheet(
      minHeight: 0,
      useRootScaffold: true,
      initHeight: 0.5,
      bottomSheetBorderRadius: BorderRadius.circular(12.r),
      maxHeight: 1,
      context: context,
      builder: (context, scrollController, bottomSheetOffset) => Material(
        color: AppColors.backgroundColor2,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: ListView(
            controller: scrollController,
            children: const [],
          ),
        ),
      ),
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  Future<dynamic> _showChangeLanguageBottomSheet(BuildContext context) {
    return showFlexibleBottomSheet(
      minHeight: 0,
      useRootScaffold: true,
      initHeight: 0.5,
      bottomSheetBorderRadius: BorderRadius.circular(12.r),
      maxHeight: 1,
      context: context,
      builder: (context, scrollController, bottomSheetOffset) => Material(
        color: AppColors.backgroundColor2,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: ListView(
            controller: scrollController,
            children: const [],
          ),
        ),
      ),
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  Material _profileElement({
    required String title,
    required IconData icon,
    required Function() onTap,
    required BuildContext context,
  }) {
    return Material(
      color: AppColors.backgroundColor2,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Container(
            height: (context.width.w - 10.w * 3 - 40.w) / 3,
            width: (context.width.w - 10.w * 3 - 40.w) / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  Gap(6.h),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Padding _title(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h, left: 5.w),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black.withOpacity(.7),
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ProfileTextFeild extends StatefulWidget {
  const ProfileTextFeild(
      {super.key,
      required this.title,
      required this.icon,
      required this.controller,
      required this.keyBoardType,
      required this.maxLines,
      required this.isPassword,
      this.isEnabled});

  final String title;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final int maxLines;
  final bool isPassword;
  final bool? isEnabled;

  @override
  State<ProfileTextFeild> createState() => _ProfileTextFeildState();
}

class _ProfileTextFeildState extends State<ProfileTextFeild> {
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initPage() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      style: const TextStyle(
        fontSize: 14.5,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundColor2,
        hintText: widget.title,
        hintStyle: const TextStyle(
          fontSize: 14.5,
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
          size: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Container(
          height: 53,
          width: 53,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: const Color.fromARGB(255, 15, 22, 28)),
          child: const Icon(Icons.edit, color: Colors.white),
        ),
      ),
    );
  }
}
