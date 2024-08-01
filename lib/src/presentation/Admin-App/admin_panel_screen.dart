import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wassit_cars_rental_app/src/core/app_extension.dart';
import 'package:wassit_cars_rental_app/src/presentation/Admin-App/statistics/statistics_screen.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AdminPanelScreen> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  // Methods
  // getConnectivity() =>
  //     subscription = Connectivity().onConnectivityChanged.listen(
  //       (result) async {
  //         isDeviceConnected = await InternetConnection().hasInternetAccess;
  //         if (!isDeviceConnected && isAlertSet == false) {
  //           showDialogBox();
  //           setState(() => isAlertSet = true);
  //         }
  //       },
  //     );

  showDialogBox() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.h),
              'لا يوجد اتصال بالإنترنت'),
          content: Text(
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.h),
              'فضلا, تفقد اتصالك بالشبكة وحاول مرة أخرى'),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                // setState(() => isAlertSet = false);
                // isDeviceConnected =
                //     await InternetConnection().hasInternetAccess;
                // if (!isDeviceConnected && isAlertSet == false) {
                //   showDialogBox();
                //   setState(() => isAlertSet = true);
                // }
              },
              child: Text('اعادة المحاولة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.h)),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // getConnectivity();

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          // context.showToast(
          //     message: "اضغط مرة أخرى للخروج من التطبيق",
          //     backgroundColor: Colors.black);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0Xdfff7e01),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                      title: Text('Welcome to Admin Panel',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white)),
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
              Container(
                color: const Color(0Xdfff7e01),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(200))),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 30,
                    children: [
                      itemDashboard(
                          'Users', Icons.group, Colors.deepOrange, () {}),
                      itemDashboard(
                          'Agencies', Icons.store, Colors.green, () {}),
                      itemDashboard(
                          'Statistics', Icons.analytics, Colors.purple, () {
                        context.push(const StatisticsAdminScreen());
                      }),
                      itemDashboard('Rentals', Icons.car_rental_rounded,
                          Colors.brown, () {}),
                      itemDashboard(
                          'Requests', Icons.border_color, Colors.grey, () {}),
                      itemDashboard(
                          'Admins',
                          Icons.admin_panel_settings_rounded,
                          Colors.blue,
                          () {}),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  elevation: 6,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: context.width,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0X4fff7e01)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text("LEAVE ADMIN PANEL",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  itemDashboard(String title, IconData iconData, Color background,
          Function() onTap) =>
      Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0X5fff7e01)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: background,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(iconData, color: Colors.white)),
                const SizedBox(height: 8),
                Text(title.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      );
}
