import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassit_cars_rental_app/src/bloc/bottom_nav_bar_cubit.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, state) {
        return FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            context.read<BottomNavBarCubit>().updateIndex(4);
          },
          child: Center(
            child: Icon(
              FontAwesomeIcons.quran,
              color: state == 4 ? Colors.white : Colors.white.withOpacity(.7),
              size: 22,
            ),
          ),
        );
      },
    );
  }
}
