import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wassit_cars_rental_app/firebase_options.dart';
import 'package:wassit_cars_rental_app/src/bloc/bottom_nav_bar_cubit.dart';
import 'package:wassit_cars_rental_app/src/core/font_family.dart';
import 'package:wassit_cars_rental_app/src/presentation/my-rentals/rental_details_screen.dart';
import 'src/injection_container.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  tz.initializeTimeZones();

  setUp();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    await Future.delayed(const Duration(seconds: 1));
    SystemChrome.restoreSystemUIOverlays();
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BottomNavBarCubit(),
            )
          ],
          child: MaterialApp(
            // locale: const Locale("ar"),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: montserrat,
            ),
            home: BlocBuilder<BottomNavBarCubit, int>(
              builder: (context, state) {
                return Builder(
                  builder: (context) {
                    ScreenUtil.init(context);

                    return const RentalDetailsScreen();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
