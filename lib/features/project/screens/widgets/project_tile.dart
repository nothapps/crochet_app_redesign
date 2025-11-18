import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:crochet_app_redesign/shared/widgets/grid_tile_clipper.dart';
import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key, required this.cutWidth});

  final double cutWidth;

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhysicalShape(
              color: Colors.transparent,
              elevation: 7,
              shadowColor: Colors.black54,
              clipper: GridTileClipper(),
              child: Stack(
                alignment: AlignmentGeometry.bottomLeft,
                children: [
                  ClipPath(
                    clipper: GridTileClipper(),
                    child: Image.network(
                      imageUrls[randomIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: cutWidth + 10, bottom: 5),
                    child: AutoSizeText(
                      'may 12th, 2025',
                      style: Theme.of(context).textTheme.labelMedium,
                      minFontSize: 8,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text('hello cute kitty :)',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        )
      ],
    );
  }
}
