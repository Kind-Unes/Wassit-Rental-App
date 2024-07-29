import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassit_cars_rental_app/src/bloc/bottom_nav_bar_cubit.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, state) {
        return AnimatedBottomNavigationBar(
          height: 45.h,
          activeIndex: state,
          backgroundColor: Colors.green,
          shadow: const Shadow(),
          onTap: (index) {
            context.read<BottomNavBarCubit>().updateIndex(index);
            //
            Navigator.popUntil(
              context,
              (route) {
                return route.isFirst;
              },
            );
          },
          leftCornerRadius: 25.r,
          rightCornerRadius: 25.r,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          iconSize: 25,
          inactiveColor: Colors.white.withOpacity(.7),
          activeColor: Colors.white,
          elevation: 30,
          icons: const [
            FontAwesomeIcons.bars,
            FontAwesomeIcons.leanpub,
            FontAwesomeIcons.personPraying,
            FontAwesomeIcons.mosque,
          ],
        );
      },
    );
  }
}
