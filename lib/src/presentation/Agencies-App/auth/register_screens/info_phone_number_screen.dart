import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassit_cars_rental_app/src/bloc/setup_info_cubit.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/injection_container.dart';
import 'package:wassit_cars_rental_app/src/models/setup_info_model.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/agency_auth_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/register_screens/info_agency_name_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/register_screens/info_image_screen.dart';
import 'package:wassit_cars_rental_app/src/widgets/text_feild.dart';

class InfoPhoneNumberScreen extends StatefulWidget {
  const InfoPhoneNumberScreen({super.key});

  @override
  State<InfoPhoneNumberScreen> createState() => _InfoPhoneNumberScreenState();
}

class _InfoPhoneNumberScreenState extends State<InfoPhoneNumberScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isNext = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
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
            top: 215.h,
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
                          _phoneNumberController.clear();
                        },
                        indicatorColor: const Color(0xFfFF7E01),
                        tabs: const [
                          // text: "AppLocalizations.of(context)!.login",
                          Tab(text: "AGENCY SET UP"),
                        ],
                      ),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Gap(30.h),
                        //welocme back
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            "Please Type The Agency's Phone Number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Gap(20.h),
                        CustomTextField(
                            label: "TYPE PHONE NUMBER",
                            icon: Icons.phone,
                            isPassword: false,
                            keyBoardType: TextInputType.phone,
                            controller: _phoneNumberController),
                        Gap(10.h),

                        PrimaryButton(
                          onPressed: () {
                            _submit();
                          },
                          title: "NEXT",
                        ),
                        //
                        Gap(10.h),
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
                      ])
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void _submit() {
    setState(() {
      isNext = true;
    });

    //! validation
    if (_phoneNumberController.text.isEmpty) {
      setState(() {
        isNext = false;
      });
      toast.error(context, "Pleas Enter The Agency's Phone Number");
      return;
    }

    if (_phoneNumberController.text.length != 10) {
      setState(() {
        isNext = false;
      });
      toast.error(context, "Phone Number must be at least 10 characters");
      return;
    }

    //! start

    context
        .read<SetUpInfoCubit>()
        .updateProperty('phoneNumber', _phoneNumberController.text.trim());
    context.push(const InfoImageScreen());

    setState(() {
      isNext = false;
    });
  }
}