import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:wassit_cars_rental_app/src/core/app_color.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/favorites/favorites_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/home/home_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Admin-App/agencies/agencies_list_admin_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Admin-App/agencies/agency_details_admin_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Admin-App/users/user_details_admin_screen.dart';

class UsersListAdminScreen extends StatefulWidget {
  const UsersListAdminScreen({super.key});

  @override
  State<UsersListAdminScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UsersListAdminScreen> {
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
                        "Users",
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
                  const SearchTextFeild(hint: "SEARCH FOR USERS"),
                  Gap(10.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // user listile
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
                          ),
                          UserListTile(
                            onTap: () {
                              context.push(const UserDetailsAdminScreen());
                            },
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

//  UserListTile
class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor2,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.amber,
              ),
              Gap(10.w),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(5.h),
                      const Text("Joined 12 Mars 2023"),
                    ]),
              )
            ])));
  }
}
