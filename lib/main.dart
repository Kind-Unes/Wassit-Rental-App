import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wassit_cars_rental_app/firebase_options.dart';
import 'package:wassit_cars_rental_app/src/bloc/bottom_nav_bar_cubit.dart';
import 'package:wassit_cars_rental_app/src/bloc/setup_info_cubit.dart';
import 'package:wassit_cars_rental_app/src/core/font_family.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/agencies_panel_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Agencies-App/auth/register_screens/info_owner_name_screen.dart';
import 'package:wassit_cars_rental_app/src/presentation/Users-App/home/home_screen.dart';
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
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
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
            ),
            BlocProvider(
              create: (context) => SetUpInfoCubit(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: montserrat,
            ),
            home: BlocBuilder<BottomNavBarCubit, int>(
              builder: (context, state) {
                return Builder(
                  builder: (context) {
                    ScreenUtil.init(context);
                    return const AdminsAppDistributor();
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

class AdminsAppDistributor extends StatelessWidget {
  const AdminsAppDistributor({super.key});

  @override
  Widget build(BuildContext context) {
    return const AgenciesPanelScreen();
  }
}

class UsersAppDistributor extends StatelessWidget {
  const UsersAppDistributor({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
