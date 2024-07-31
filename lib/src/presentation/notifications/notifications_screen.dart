import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/favorites/favorites_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isPageLoading = true;

  @override
  void initState() {
    initPage();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    super.initState();
  }

  initPage() {
    setState(() {
      isPageLoading = true;
    });

    setState(() {
      isPageLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyIconButton(
                      size: 45.sp,
                      icon: FontAwesomeIcons.arrowLeft,
                      onTap: () {},
                      iconSize: 15,
                    ),
                    Center(
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Transform.rotate(
                      angle: 0.6,
                      child: MyIconButton(
                        size: 45.sp,
                        icon: Icons.cleaning_services_outlined,
                        onTap: () {},
                        iconSize: 15,
                      ),
                    ),
                  ],
                ),
                //
                Gap(20.h),

                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
                const NotificationElement(),
              ],
            ),
          ),
        ));
  }
}

class NotificationElement extends StatelessWidget {
  const NotificationElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.only(bottom: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: Colors.white),
      padding: EdgeInsets.all(10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Container(
            width: 40.w,
            height: 40.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
            child: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          Gap(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Gap(3.h),
                Text(
                  "May 12, 2021",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                Gap(2.h),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
          //
        ],
      ),
    );
  }
}
