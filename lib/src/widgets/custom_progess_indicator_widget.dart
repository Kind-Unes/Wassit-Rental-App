import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator(
      {super.key, required this.scale, required this.color});

  final double scale;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: LoadingAnimationWidget.fourRotatingDots(
        key: UniqueKey(),
        color: color,
        size: 30,
      ),
    );
  }
}
