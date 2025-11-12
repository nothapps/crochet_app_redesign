import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomNavBarShape extends StatelessWidget {
  const CustomNavBarShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          CustomPaint(
              painter: NavBarPainter(
                  navBarColor: Theme.of(context).colorScheme.surfaceContainer),
              child: Container(
                height: navBarHeight,
              ))
        ],
      ),
    );
  }
}

class NavBarPainter extends CustomPainter {
  NavBarPainter({super.repaint, required this.navBarColor});

  final Color navBarColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = navBarColor
      ..style = PaintingStyle.fill;

    // rectangle with rounded corners
    final Path rectPath = Path();
    rectPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(30)));

    // notch in the rectangle
    final notchWidth = 120;
    final notchDepth = 30;
    final rectCenter = size.width / 2;

    Path notchPath = Path();
    notchPath.moveTo(rectCenter - notchWidth * 0.5, 0);
    notchPath.quadraticBezierTo(rectCenter - notchWidth * 0.35, 0,
        rectCenter - notchWidth * 0.25, notchDepth / 2);
    notchPath.quadraticBezierTo(rectCenter, size.height * 0.55,
        rectCenter + notchWidth * 0.25, notchDepth / 2);
    notchPath.quadraticBezierTo(
        rectCenter + notchWidth * 0.35, 0, rectCenter + notchWidth / 2, 0);

    // combined
    Path combinedPath = Path.combine(
      PathOperation.difference,
      rectPath,
      notchPath,
    );
    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
