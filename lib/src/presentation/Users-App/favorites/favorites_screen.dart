import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(50),
            Row(
              children: [
                MyIconButton(
                  size: 45.sp,
                  icon: FontAwesomeIcons.arrowLeft,
                  onTap: () {},
                  iconSize: 15,
                ),
                const Spacer(),
                Text(
                  "Favorites Cars",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MyIconButton(
                  size: 45.sp,
                  icon: FontAwesomeIcons.search,
                  onTap: () {},
                  iconSize: 15,
                ),
              ],
            ),
            Gap(20.h),
            const Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesElement extends StatelessWidget {
  const FavoritesElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: Banner(
        location: BannerLocation.topStart,
        message: "Available",
        textStyle: const TextStyle(fontSize: 10),
        color: Colors.green,
        child: Container(
          width: double.infinity,
          height: 120.h,
          padding: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              //
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r)),
                      color: Colors.amber),
                ),
              ),
              Gap(20.w),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Toyota Corolla",
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold)),
                    Gap(5.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text("Price:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14.sp)),
                            Gap(10.w),
                            Text("20,000DA",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12.sp)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Year:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14.sp)),
                        Gap(10.w),
                        Text("2014",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.sp)),
                        const Spacer(),
                        Text("(200)",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.sp)),
                        Gap(2.w),
                        const Icon(
                          Icons.favorite,
                          size: 14,
                        ),
                        Gap(5.w),
                      ],
                    ),
                    Gap(7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.translate(
                          offset: Offset(-5.h, 0),
                          child: Expanded(
                            child: Container(
                              width: 115.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(2000.r)),
                              child: Center(
                                child: Text("Rental Now",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12.sp,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        MyIconButton(
                            size: 30,
                            icon: Icons.favorite_outline,
                            onTap: () {},
                            iconSize: 25),
                      ],
                    ),
                  ],
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.size,
    required this.icon,
    required this.onTap,
    required this.iconSize,
    this.color,
    this.fontColor,
  });

  final double size;
  final double iconSize;
  final IconData icon;
  final Function() onTap;
  final Color? color;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(200),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(200),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          child: Center(
            child: Icon(
              icon,
              color: fontColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
