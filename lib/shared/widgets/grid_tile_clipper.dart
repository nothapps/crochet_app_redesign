import 'package:flutter/material.dart';

class GridTileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double cutHeight = 30;
    final double cornerRadius = 20;
    Path path = Path();

    path.moveTo(0, cornerRadius);
    path.lineTo(0, size.height - cornerRadius);
    path.quadraticBezierTo(0, size.height, cornerRadius, size.height);
    path.lineTo(size.width * 0.3 - cornerRadius, size.height);
    path.quadraticBezierTo(size.width * 0.3, size.height, size.width * 0.3,
        size.height - cutHeight / 2);
    path.quadraticBezierTo(size.width * 0.3, size.height - cutHeight,
        size.width * 0.3 + cornerRadius, size.height - cutHeight);
    path.lineTo(size.width - cornerRadius, size.height - cutHeight);
    path.quadraticBezierTo(size.width, size.height - cutHeight, size.width,
        size.height - (cutHeight + cornerRadius));
    path.lineTo(size.width, cornerRadius);
    path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0);
    path.lineTo(cornerRadius, 0);
    path.quadraticBezierTo(0, 0, 0, cornerRadius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
