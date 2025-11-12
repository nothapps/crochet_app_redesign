import 'dart:math';

import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrls = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfWqZMm59i5xb12Ut6RmbbdTeNOr9GtIvlnQ&s',
      'https://image.petmd.com/files/inline-images/black-cat-gold-eyes.jpeg?VersionId=az8eSZaz3xQUDlE7Z6.0.le6vQYDoOKy',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/974px-Gatto_europeo4.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlkIK7GshHXP0c1rDDLcaoHetAiSxQOac2wg&s'
    ];
    final random = Random();
    final randomIndex = random.nextInt(imageUrls.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final cutWidth = constraints.maxWidth * 0.3;

            return PhysicalShape(
              color: Colors.transparent,
              elevation: 7,
              shadowColor: Colors.black54,
              clipper: ProjectTileClipper(),
              child: Stack(
                alignment: AlignmentGeometry.bottomLeft,
                children: [
                  ClipPath(
                    clipper: ProjectTileClipper(),
                    child: Image.network(
                      imageUrls[randomIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: cutWidth + 10, bottom: 5),
                    child: Text('may 12th, 2025',
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('hello cute kitty :)',
              style: Theme.of(context).textTheme.labelLarge),
        )
      ],
    );
  }
}

class ProjectTileClipper extends CustomClipper<Path> {
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

// class TileShadowPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final double cutHeight = 30;
//     final double cornerRadius = 20;
//     Path path = Path();

//     path.moveTo(0, cornerRadius);
//     path.lineTo(0, size.height - cornerRadius);
//     path.quadraticBezierTo(0, size.height, cornerRadius, size.height);
//     path.lineTo(size.width * 0.3 - cornerRadius, size.height);
//     path.quadraticBezierTo(size.width * 0.3, size.height, size.width * 0.3,
//         size.height - cutHeight / 2);
//     path.quadraticBezierTo(size.width * 0.3, size.height - cutHeight,
//         size.width * 0.3 + cornerRadius, size.height - cutHeight);
//     path.lineTo(size.width - cornerRadius, size.height - cutHeight);
//     path.quadraticBezierTo(size.width, size.height - cutHeight, size.width,
//         size.height - (cutHeight + cornerRadius));
//     path.lineTo(size.width, cornerRadius);
//     path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0);
//     path.lineTo(cornerRadius, 0);
//     path.quadraticBezierTo(0, 0, 0, cornerRadius);
//     path.close();

//     canvas.drawShadow(path, Colors.black45, 5, false);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
