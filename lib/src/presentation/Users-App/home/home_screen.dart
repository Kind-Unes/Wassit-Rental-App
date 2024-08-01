import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cherry_toast/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/bloc/bottom_nav_bar_cubit.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // theme
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Material(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(200),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(200),
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Hellalet Younes",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(200),
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.bell,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  const Row(
                    children: [
                      Gap(10),
                      Icon(FontAwesomeIcons.location),
                      Gap(20),
                      Expanded(
                        child: Text(
                          "Barika, Batna, Algeria",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  const HomeSearchTextField(),
                  const Gap(20),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Availabe Cars",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                animateToClosest: true,
                reverse: false,
                viewportFraction: .84,
              ),
              items: const [
                CarElement(),
              ],
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      const Text(
                        "Our Agencies",
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        "View All",
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(.5),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: const [
                      AgencyElement(),
                      AgencyElement(),
                      AgencyElement(),
                      AgencyElement(),
                    ],
                  ),
                  Gap(50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgencyElement extends StatelessWidget {
  const AgencyElement({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundColor2,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          height: (context.width.w - 10.w - 40.w) / 2 + 35.h,
          width: (context.width.w - 10.w - 40.w) / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.backgroundColor2,
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.4),
                      ))),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Agency Name",
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      // TOTAL CARS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.car,
                            size: 12,
                          ),
                          const Gap(5),
                          Text(
                            "200 Cars",
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black.withOpacity(.5),
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ]),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CarElement extends StatelessWidget {
  const CarElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              //
              log("1");
              //
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: (MediaQuery.of(context).size.width) / 1.3,
              height: 165.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.h,
                    width: (MediaQuery.of(context).size.width - 40 - 10) / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Toyota Yaris",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),

                            //
                            // Row(
                            //   children: [
                            //     Icon(
                            //       FontAwesomeIcons.eye,
                            //       color: Colors.black.withOpacity(.7),
                            //       size: 10,
                            //     ),
                            //     Gap(3.w),
                            //     Text(
                            //       "(200)",
                            //       maxLines: 1,
                            //       style: TextStyle(
                            //           overflow: TextOverflow.ellipsis,
                            //           color: Colors.black.withOpacity(.7),
                            //           fontSize: 11,
                            //           fontWeight: FontWeight.normal),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        const Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "20.000DA",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "2021",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            child: Transform.scale(
          scale: 0.75,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                log("dqsd");
              },
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        )),
      ],
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, state) {
        return Positioned(
            bottom: 20.h,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 36, 41),
                borderRadius: BorderRadius.circular(200),
              ),
              width: context.width,
              padding: EdgeInsets.symmetric(vertical: 7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<BottomNavBarCubit>().updateIndex(0);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          state == 0 ? Icons.home : Icons.home_outlined,
                          color: state == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          size: 27,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<BottomNavBarCubit>().updateIndex(1);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          state == 01
                              ? Icons.category
                              : Icons.category_outlined,
                          color: state == 01
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          size: 27,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<BottomNavBarCubit>().updateIndex(2);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          state == 02 ? Icons.favorite : Icons.favorite_outline,
                          color: state == 02
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          size: 25,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<BottomNavBarCubit>().updateIndex(3);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          state == 03 ? Icons.person : Icons.person,
                          color: state == 03
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          size: 27,
                        )),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: const TextStyle(
          fontSize: 14.5,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'SEARCH YOUR CAR',
          hintStyle: const TextStyle(
            fontSize: 14.5,
            color: Colors.grey,
          ),
          prefixIcon: const Icon(
            FontAwesomeIcons.search,
            color: Colors.grey,
            size: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29000.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Container(
            height: 53,
            width: 53,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29000),
                color: const Color.fromARGB(255, 15, 22, 28)),
            child: const Icon(Icons.filter_list, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
