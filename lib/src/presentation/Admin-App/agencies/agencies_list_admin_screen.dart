import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/favorites/favorites_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/home/home_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Admin-App/agencies/agency_details_admin_screen.dart';

class AgenciesListAdminScreen extends StatefulWidget {
  const AgenciesListAdminScreen({super.key});

  @override
  State<AgenciesListAdminScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AgenciesListAdminScreen> {
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        iconSize: 15,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Agencies",
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
                  const SearchTextFeild(hint: "SEARCH FOR AGENCIES"),
                  Gap(10.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: [
                              AgencyElement(onTap: () {
                                context.push(const AgencyDetailsAdminScreen());
                              }),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                              AgencyElement(onTap: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({
    super.key,
    required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 14.5,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundColor2,
        hintText: hint,
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
      ),
    );
  }
}
