import 'package:flutter/material.dart';

class RightToLeftShapes extends CustomPainter {
  RightToLeftShapes(
      {super.repaint,
      required this.bottomShapeColor,
      required this.topShapeColor,
      required this.leftModifier,
      required this.rightModifier,
      required this.topModifier,
      required this.bottomModifier});

  final Color bottomShapeColor;
  final Color topShapeColor;
  final double leftModifier;
  final double rightModifier;
  final double topModifier;
  final double bottomModifier;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint bottomShapePaint = Paint()
      ..color = bottomShapeColor
      ..style = PaintingStyle.fill;

    final double cornerRadius = 20;
    final double shift = 10;
    final double leftWidth = size.width * leftModifier;
    final double rightWidth = size.width * rightModifier;
    final double topGap = size.height * topModifier;
    final double bottomGap = size.height * bottomModifier;

    final Path bottomShapePath = Path();
    bottomShapePath.moveTo(cornerRadius, topGap);
    bottomShapePath.quadraticBezierTo(0, topGap, 0, topGap + cornerRadius);
    bottomShapePath.lineTo(0, size.height - cornerRadius);
    bottomShapePath.quadraticBezierTo(
        0, size.height - shift, cornerRadius, size.height - shift);
    bottomShapePath.lineTo(leftWidth - cornerRadius, size.height - shift);
    bottomShapePath.quadraticBezierTo(leftWidth, size.height - shift, leftWidth,
        size.height - cornerRadius - shift);
    bottomShapePath.lineTo(leftWidth, bottomGap + cornerRadius);
    bottomShapePath.quadraticBezierTo(
        leftWidth, bottomGap, leftWidth + cornerRadius, bottomGap);
    bottomShapePath.lineTo(size.width - cornerRadius - shift, bottomGap);
    bottomShapePath.quadraticBezierTo(size.width - shift, bottomGap,
        size.width - shift, bottomGap - cornerRadius);
    bottomShapePath.lineTo(size.width - shift, cornerRadius);
    bottomShapePath.quadraticBezierTo(
        size.width - shift, 0, size.width - cornerRadius - shift, 0);
    bottomShapePath.lineTo(rightWidth + cornerRadius, 0);
    bottomShapePath.quadraticBezierTo(rightWidth, 0, rightWidth, cornerRadius);
    bottomShapePath.lineTo(rightWidth, topGap - cornerRadius);
    bottomShapePath.quadraticBezierTo(
        rightWidth, topGap, rightWidth - cornerRadius, topGap);
    bottomShapePath.close();

    canvas.drawPath(bottomShapePath, bottomShapePaint);

    canvas.translate(10, 10);

    final Paint topShapePaint = Paint()
      ..color = topShapeColor
      ..style = PaintingStyle.fill;

    final Path topShapePath = Path();
    topShapePath.moveTo(cornerRadius, topGap);
    topShapePath.quadraticBezierTo(0, topGap, 0, topGap + cornerRadius);
    topShapePath.lineTo(0, size.height - cornerRadius - shift);
    topShapePath.quadraticBezierTo(
        0, size.height - shift, cornerRadius, size.height - shift);
    topShapePath.lineTo(leftWidth - cornerRadius, size.height - shift);
    topShapePath.quadraticBezierTo(leftWidth, size.height - shift, leftWidth,
        size.height - cornerRadius - shift);
    topShapePath.lineTo(leftWidth, bottomGap + cornerRadius);
    topShapePath.quadraticBezierTo(
        leftWidth, bottomGap, leftWidth + cornerRadius, bottomGap);
    topShapePath.lineTo(size.width - cornerRadius, bottomGap);
    topShapePath.quadraticBezierTo(size.width - shift, bottomGap,
        size.width - shift, bottomGap - cornerRadius);
    topShapePath.lineTo(size.width - shift, cornerRadius);
    topShapePath.quadraticBezierTo(
        size.width - shift, 0, size.width - cornerRadius - shift, 0);
    topShapePath.lineTo(rightWidth + cornerRadius, 0);
    topShapePath.quadraticBezierTo(rightWidth, 0, rightWidth, cornerRadius);
    topShapePath.lineTo(rightWidth, topGap - cornerRadius);
    topShapePath.quadraticBezierTo(
        rightWidth, topGap, rightWidth - cornerRadius, topGap);
    topShapePath.close();

    canvas.drawPath(topShapePath, topShapePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class RightToLeftShapes extends CustomPainter {
//   RightToLeftShapes(
//       {super.repaint,
//       required this.bottomShapeColor,
//       required this.topShapeColor,
//       required this.leftModifier,
//       required this.rightModifier,
//       required this.topModifier,
//       required this.bottomModifier});

//   final Color bottomShapeColor;
//   final Color topShapeColor;
//   final double leftModifier;
//   final double rightModifier;
//   final double topModifier;
//   final double bottomModifier;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint bottomShapePaint = Paint()
//       ..color = bottomShapeColor
//       ..style = PaintingStyle.fill;

//     final double cornerRadius = 20;
//     final double shift = 10;
//     final double leftWidth = size.width * leftModifier;
//     final double rightWidth = size.width * rightModifier;
//     final double topGap = size.height * topModifier;
//     final double bottomGap = size.height * bottomModifier;

//     final Path bottomShapePath = Path();
//     bottomShapePath.moveTo(cornerRadius, topGap);
//     bottomShapePath.quadraticBezierTo(0, topGap, 0, topGap + cornerRadius);
//     bottomShapePath.lineTo(0, size.height);
//     bottomShapePath.lineTo(leftWidth, size.height);
//     bottomShapePath.lineTo(leftWidth, bottomGap + cornerRadius);
//     bottomShapePath.quadraticBezierTo(
//         leftWidth, bottomGap, leftWidth + cornerRadius, bottomGap);
//     bottomShapePath.lineTo(size.width - cornerRadius - shift, bottomGap);
//     bottomShapePath.quadraticBezierTo(size.width - shift, bottomGap,
//         size.width - shift, bottomGap - cornerRadius);
//     bottomShapePath.lineTo(size.width - shift, 0);
//     bottomShapePath.lineTo(rightWidth, 0);
//     bottomShapePath.quadraticBezierTo(rightWidth, 0, rightWidth, cornerRadius);
//     bottomShapePath.lineTo(rightWidth, topGap - cornerRadius);
//     bottomShapePath.quadraticBezierTo(
//         rightWidth, topGap, rightWidth - cornerRadius, topGap);
//     bottomShapePath.close();

//     canvas.drawPath(bottomShapePath, bottomShapePaint);

//     canvas.translate(10, 10);

//     final Paint topShapePaint = Paint()
//       ..color = topShapeColor
//       ..style = PaintingStyle.fill;

//     final Path topShapePath = Path();
//     topShapePath.moveTo(cornerRadius, topGap);
//     topShapePath.quadraticBezierTo(0, topGap, 0, topGap + cornerRadius);
//     topShapePath.lineTo(0, size.height);
//     topShapePath.lineTo(leftWidth, size.height);
//     topShapePath.lineTo(leftWidth, bottomGap + cornerRadius);
//     topShapePath.quadraticBezierTo(
//         leftWidth, bottomGap, leftWidth + cornerRadius, bottomGap);
//     topShapePath.lineTo(size.width - cornerRadius, bottomGap);
//     topShapePath.quadraticBezierTo(size.width - shift, bottomGap,
//         size.width - shift, bottomGap - cornerRadius);
//     topShapePath.lineTo(size.width - shift, -10);
//     topShapePath.lineTo(rightWidth, -10);
//     topShapePath.lineTo(rightWidth, topGap - cornerRadius);
//     topShapePath.quadraticBezierTo(
//         rightWidth, topGap, rightWidth - cornerRadius, topGap);
//     topShapePath.close();

//     canvas.drawPath(topShapePath, topShapePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
