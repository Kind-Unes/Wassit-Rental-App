import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/presentation/favorites/favorites_screen.dart';

class MyRentalsScreen extends StatelessWidget {
  const MyRentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Column(
                children: [
                  // Rental History Element
                  MyRentalsElement(),
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
class MyRentalsElement extends StatelessWidget {
  const MyRentalsElement({
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
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: (MediaQuery.of(context).size.width),
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
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Toyota Yaris",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "20.000DA",
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
// from X DATE to Y DATE WIDGET
                            Row(
                              children: [
                                Text(
                                  "12/12/2021",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black.withOpacity(.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Gap(5.w),
                                const Icon(Icons.arrow_right_alt_sharp),
                                Gap(5.w),
                                Text(
                                  "15/12/2021",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black.withOpacity(.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),

                            MyIconButton(
                              size: 40,
                              icon: FontAwesomeIcons.arrowRight,
                              onTap: () {},
                              iconSize: 20,
                              color: Colors.black,
                              fontColor: Colors.white,
                              key: const Key(""),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),
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
              onPressed: () {},
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        )),
      ],
    );
  }
}
