import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/favorites/favorites_screen.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  bool isPageLoading = true;

  @override
  void initState() {
    initPage();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
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
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                    height: context.height / 2,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: context.width,
                          child: ShaderMask(
                            blendMode: BlendMode.dstIn,
                            shaderCallback: (bounds) => const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [
                                Color.fromARGB(0, 0, 0, 0),
                                Color.fromARGB(27, 0, 0, 0),
                                Color.fromARGB(47, 0, 0, 0),
                                Color.fromARGB(60, 0, 0, 0),
                                Color.fromARGB(216, 0, 0, 0),
                                Color.fromARGB(255, 0, 0, 0),
                              ],
                            ).createShader(bounds),
                            child: Image.asset(
                              "assets/images/screenshot.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Gap(40.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyIconButton(
                                    size: 45.sp,
                                    icon: FontAwesomeIcons.arrowLeft,
                                    onTap: () {},
                                    iconSize: 15,
                                    fontColor: Colors.white,
                                    color:
                                        const Color.fromARGB(255, 50, 55, 61),
                                  ),
                                  Center(
                                    child: Text(
                                      "Cars Details",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  MyIconButton(
                                    size: 45.sp,
                                    icon: Icons.favorite,
                                    onTap: () {},
                                    iconSize: 15,
                                    fontColor: Colors.white,
                                    color:
                                        const Color.fromARGB(255, 50, 55, 61),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 25.h,
                          right: 0.w,
                          left: 0.w,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 8.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.circular(200000)),
                                ),
                                Gap(10.w),
                                Container(
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(200000)),
                                ),
                                Gap(10.w),
                                Container(
                                  width: 8.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.circular(200000)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -10.h),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
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
                                  borderRadius: BorderRadius.circular(2000)),
                            ),
                          ),
                          Gap(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Testla Model 3",
                                  maxLines: 4,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.eye,
                                    color: Colors.black.withOpacity(.7),
                                    size: 17,
                                  ),
                                  Gap(7.w),
                                  Text(
                                    "(200)",
                                    maxLines: 1,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(12.h),
                          ReadMoreText(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publi",
                            lessStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            moreStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            trimLines: 2,
                            isExpandable: true,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: "Read more",
                            trimExpandedText: "\nRead Less",
                            style:
                                TextStyle(color: Colors.black.withOpacity(.6)),
                          ),
                          Gap(15.h),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Features",
                                maxLines: 4,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Gap(5.h),
                          //

                          Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: [
                              _detailElement(
                                  value: "Automatic",
                                  title: 'Gearbox',
                                  icon: Icons.transit_enterexit,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "Petrol",
                                  title: 'Fuel Type',
                                  icon: Icons.local_gas_station,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "2023",
                                  title: 'Year',
                                  icon: Icons.calendar_today,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "5 Seats",
                                  title: 'Seats Number',
                                  icon: Icons.event_seat,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "150 HP",
                                  title: 'Engine Power',
                                  icon: Icons.engineering,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "Luxury",
                                  title: 'Trim',
                                  icon: Icons.dashboard,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "Model X",
                                  title: 'Model Name',
                                  icon: Icons.directions_car,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "Tesla",
                                  title: 'Brand',
                                  icon: Icons.car_repair,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "20,000 km",
                                  title: 'Mileage',
                                  icon: Icons.speed,
                                  onTap: () {},
                                  context: context),
                              _detailElement(
                                  value: "Yes",
                                  title: 'Conditioner',
                                  icon: Icons.ac_unit,
                                  onTap: () {},
                                  context: context),
                            ],
                          ),
                          Gap(100.h),
                          //
                        ],
                      ),
                    ),
                  ),
                ])),
            Positioned(
                bottom: 0.h,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20.w,
                    left: 20.w,
                    bottom: 20.w,
                    top: 16.h,
                  ),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          Text(
                            "20,000DA",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      Gap(15.w),
                      //
                      Expanded(
                        child: Material(
                          color: const Color.fromARGB(255, 29, 32, 37),
                          borderRadius: BorderRadius.circular(2000.r),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(2000.r),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2000.r)),
                              child: Center(
                                child: Text(
                                  "Rental Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  Material _detailElement({
    required String title,
    required String value,
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
            height: 100.h,
            width: (context.width.w - 10.w * 3 - 30.w) / 3,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(7.sp),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 17,
                  ),
                ),
                Gap(10.h),
                Text(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  value,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}
