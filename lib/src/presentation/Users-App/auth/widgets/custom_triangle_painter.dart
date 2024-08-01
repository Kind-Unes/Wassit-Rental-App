import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 30, 30, 30)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, 0); // Start at the top-center corner
    path.lineTo(
        size.width, size.height); // Draw a line to the bottom-right corner
    path.lineTo(0, size.height); // Draw a line to the bottom-left corner
    path.close(); // Close the path to form a triangle

    // Create a path for the rounded corners
    Path clippedPath = Path()
      ..moveTo(size.width / 2, 0) // Start at the top-center corner
      ..arcToPoint(
        Offset(size.width, size.height), // Bottom-right corner
        radius: const Radius.circular(8),
      )
      ..lineTo(0, size.height) // Draw a line to the bottom-left corner
      ..arcToPoint(
        Offset(0, size.height), // Bottom-left corner
        radius: const Radius.circular(8),
        clockwise:
            false, // Counter-clockwise direction to maintain the triangle shape
      )
      ..close();

    // Clip the triangle path using the rounded corner path
    path = Path.combine(PathOperation.intersect, clippedPath, path);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleWidget extends StatelessWidget {
  const TriangleWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(),
      size: size,
    );
  }
}
