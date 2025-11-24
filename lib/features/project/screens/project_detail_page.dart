import 'package:auto_size_text/auto_size_text.dart';
import 'package:crochet_app_redesign/features/project/logic/detail_page_logic.dart';
import 'package:crochet_app_redesign/features/project/screens/widgets/shape_painters.dart';
import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectDetailPage extends HookWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = ProjectDetailPageLogic();
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safePaddingTop = MediaQuery.of(context).padding.top;

    List<Widget> stackChildren = logic.isFirstOnTop.value
        ? [
            PictureOne(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            PictureTwo(screenHeight: screenHeight, screenWidth: screenWidth)
          ]
        : [
            PictureTwo(screenHeight: screenHeight, screenWidth: screenWidth),
            PictureOne(screenHeight: screenHeight, screenWidth: screenWidth)
          ];

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Kitty'),
          backgroundColor: Colors.transparent,
          actionsPadding: EdgeInsets.only(right: pagePadding),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            )
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: pagePadding, vertical: 0),
          child: Stack(
            children: [
              CustomPaint(
                painter: RightToLeftShapes(
                    bottomShapeColor: Theme.of(context).colorScheme.primary,
                    topShapeColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    leftModifier: 0.35,
                    rightModifier: 0.75,
                    topModifier: 0.1,
                    bottomModifier: 0.45),
                child: SizedBox(
                  height: screenHeight,
                  width: screenWidth,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    logic.isFirstOnTop.value = !logic.isFirstOnTop.value,
                // onDoubleTap: ,
                child: Stack(children: stackChildren),
              ),
              Positioned(
                top: screenHeight * bottomShapeBoundary + 50,
                left: 10,
                right: screenWidth * 0.6,
                child: SizedBox(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.55,
                  child: Column(
                    spacing: 100,
                    children: [
                      Text('Yarn',
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text('Hooks',
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text('Counters',
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text('Notes',
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PictureTwo extends StatelessWidget {
  const PictureTwo({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * topShapeBoundary,
      left: -40,
      right: 0,
      child: SizedBox(
        height: screenHeight * 0.35,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlkIK7GshHXP0c1rDDLcaoHetAiSxQOac2wg&s',
                height: screenHeight * 0.3,
                width: screenWidth * 0.45,
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class PictureOne extends StatelessWidget {
  const PictureOne({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * topShapeBoundary + 20,
      left: 0,
      right: -40,
      child: SizedBox(
        height: screenHeight * 0.35,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                'https://image.petmd.com/files/inline-images/black-cat-gold-eyes.jpeg?VersionId=az8eSZaz3xQUDlE7Z6.0.le6vQYDoOKy',
                height: screenHeight * 0.3,
                width: screenWidth * 0.45,
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
