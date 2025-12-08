import 'package:flutter/material.dart';

class ProjectPhoto extends StatelessWidget {
  const ProjectPhoto(
      {super.key,
      required this.url,
      required this.top,
      required this.left,
      required this.right,
      required this.screenHeight,
      required this.screenWidth});

  final String url;
  final double top;
  final double left;
  final double right;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: SizedBox(
        height: screenHeight * 0.35,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(url,
                height: screenHeight * 0.28,
                width: screenWidth * 0.5,
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
