import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/favorites/favorites_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/my-rentals/rental_details_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/my-rentals/widgets/rental_widget.dart';

class MyRentalsScreen extends StatefulWidget {
  const MyRentalsScreen({super.key});

  @override
  State<MyRentalsScreen> createState() => _MyRentalsScreenState();
}

class _MyRentalsScreenState extends State<MyRentalsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyIconButton(
                    size: 45.sp,
                    icon: FontAwesomeIcons.arrowLeft,
                    onTap: () {},
                    iconSize: 15,
                  ),
                  Text(
                    "Rentals History",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                  MyIconButton(
                    size: 45.sp,
                    icon: FontAwesomeIcons.search,
                    onTap: () {
                      //
                    },
                    iconSize: 15,
                  ),
                ],
              ),
              Gap(20.h),
              Column(
                children: [
                  // Rental History Element
                  MyRentalsElement(
                    onTap: () {
                      context.push(const RentalDetailsScreen());
                    },
                  ),
                  MyRentalsElement(
                    onTap: () {},
                  ),
                  MyRentalsElement(
                    onTap: () {},
                  ),
                  MyRentalsElement(
                    onTap: () {},
                  ),
                  MyRentalsElement(
                    onTap: () {},
                  ),
                  MyRentalsElement(
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MyRentalsElement