import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/favorites/favorites_screen.dart';

class StatisticsAdminScreen extends StatefulWidget {
  const StatisticsAdminScreen({super.key});

  @override
  State<StatisticsAdminScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatisticsAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Gap(50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyIconButton(
                    size: 45.sp,
                    color: AppColors.backgroundColor2,
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
                    "Statistics",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
              Gap(10.h),
              // stats tile
              const StatsTile(
                title: "Agencies",
                value: "10",
                icon: FontAwesomeIcons.building,
              ),
              const StatsTile(
                title: "Active Users",
                value: "10",
                icon: Icons.person_add,
              ),
              const StatsTile(
                title: "Overall Users",
                value: "10",
                icon: Icons.person,
              ),
              const StatsTile(
                title: "Active Rentals",
                value: "10",
                icon: Icons.car_rental,
              ),
              const StatsTile(
                title: "Overall Rentals",
                value: "10",
                icon: Icons.car_rental_rounded,
              ),
            ],
          ),
        ));
  }
}

// StatsTile
class StatsTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const StatsTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor2,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 30.sp,
          ),
          Gap(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(5.h),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            FontAwesomeIcons.arrowRight,
            color: Colors.black,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
