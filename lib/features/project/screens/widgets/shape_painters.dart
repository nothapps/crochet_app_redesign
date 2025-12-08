import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';

class RightToLeftShapes extends CustomPainter {
  RightToLeftShapes(
      {super.repaint,
      required this.bottomShapeColor,
      required this.topShapeColor,
      required this.leftModifier,
      required this.rightModifier,
      required this.bottomModifier});

  final Color bottomShapeColor;
  final Color topShapeColor;
  final double leftModifier;
  final double rightModifier;
  final double bottomModifier;

  @override
  void paint(Canvas canvas, Size size) {
    final double cornerRadius = 20;
    final double shift = 10;

    // shape modifiers
    final double topNotch = size.height * allShapesTop;
    final double leftWidth = size.width * leftModifier;
    final double rightWidth = size.width * rightModifier;
    final double bottomNotch = size.height * bottomModifier;

    // bottom shape
    final Paint bottomShapePaint = Paint()
      ..color = bottomShapeColor
      ..style = PaintingStyle.fill;

    final Path bottomShapePath = Path();
    bottomShapePath.moveTo(cornerRadius, size.height * allShapesTop);
    bottomShapePath.quadraticBezierTo(0, topNotch, 0, topNotch + cornerRadius);
    bottomShapePath.lineTo(0, size.height - cornerRadius);
    bottomShapePath.quadraticBezierTo(
        0, size.height - shift, cornerRadius, size.height - shift);
    bottomShapePath.lineTo(leftWidth - cornerRadius, size.height - shift);
    bottomShapePath.quadraticBezierTo(leftWidth, size.height - shift, leftWidth,
        size.height - cornerRadius - shift);
    bottomShapePath.lineTo(leftWidth, bottomNotch + cornerRadius);
    bottomShapePath.quadraticBezierTo(
        leftWidth, bottomNotch, leftWidth + cornerRadius, bottomNotch);
    bottomShapePath.lineTo(size.width - cornerRadius - shift, bottomNotch);
    bottomShapePath.quadraticBezierTo(size.width - shift, bottomNotch,
        size.width - shift, bottomNotch - cornerRadius);
    bottomShapePath.lineTo(size.width - shift, cornerRadius);
    bottomShapePath.quadraticBezierTo(
        size.width - shift, 0, size.width - cornerRadius - shift, 0);
    bottomShapePath.lineTo(rightWidth + cornerRadius, 0);
    bottomShapePath.quadraticBezierTo(rightWidth, 0, rightWidth, cornerRadius);
    bottomShapePath.lineTo(rightWidth, topNotch - cornerRadius);
    bottomShapePath.quadraticBezierTo(
        rightWidth, topNotch, rightWidth - cornerRadius, topNotch);
    bottomShapePath.close();

    canvas.drawPath(bottomShapePath, bottomShapePaint);

    canvas.translate(10, 10);

    // top shape
    final Paint topShapePaint = Paint()
      ..color = topShapeColor
      ..style = PaintingStyle.fill;

    final Path topShapePath = Path();
    topShapePath.moveTo(cornerRadius, topNotch);
    topShapePath.quadraticBezierTo(0, topNotch, 0, topNotch + cornerRadius);
    topShapePath.lineTo(0, size.height - cornerRadius - shift);
    topShapePath.quadraticBezierTo(
        0, size.height - shift, cornerRadius, size.height - shift);
    topShapePath.lineTo(leftWidth - cornerRadius, size.height - shift);
    topShapePath.quadraticBezierTo(leftWidth, size.height - shift, leftWidth,
        size.height - cornerRadius - shift);
    topShapePath.lineTo(leftWidth, bottomNotch + cornerRadius);
    topShapePath.quadraticBezierTo(
        leftWidth, bottomNotch, leftWidth + cornerRadius, bottomNotch);
    topShapePath.lineTo(size.width - cornerRadius, bottomNotch);
    topShapePath.quadraticBezierTo(size.width - shift, bottomNotch,
        size.width - shift, bottomNotch - cornerRadius);
    topShapePath.lineTo(size.width - shift, cornerRadius);
    topShapePath.quadraticBezierTo(
        size.width - shift, 0, size.width - cornerRadius - shift, 0);
    topShapePath.lineTo(rightWidth + cornerRadius, 0);
    topShapePath.quadraticBezierTo(rightWidth, 0, rightWidth, cornerRadius);
    topShapePath.lineTo(rightWidth, topNotch - cornerRadius);
    topShapePath.quadraticBezierTo(
        rightWidth, topNotch, rightWidth - cornerRadius, topNotch);
    topShapePath.close();

    canvas.drawPath(topShapePath, topShapePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
