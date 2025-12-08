import 'package:crochet_app_redesign/features/project/logic/detail_page_logic.dart';
import 'package:crochet_app_redesign/features/project/screens/widgets/detail_item_tiles.dart';
import 'package:crochet_app_redesign/features/project/screens/widgets/project_image.dart';
import 'package:crochet_app_redesign/features/project/screens/widgets/shape_painters.dart';
import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectDetailPage extends HookWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = ProjectDetailPageLogic();

    // screen size
    final safePaddingTop = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight =
        MediaQuery.sizeOf(context).height - safePaddingTop - pagePadding;

    final double itemsPadding = 10;
    final double rowsPaddingTop = 20;
    final double gapBetweenRows = 8;

    List<Widget> projectPhotos = [
      ProjectPhoto(
          url:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlkIK7GshHXP0c1rDDLcaoHetAiSxQOac2wg&s',
          top: screenHeight * allShapesTop + 20,
          left: 0,
          right: -20,
          screenHeight: screenHeight,
          screenWidth: screenWidth),
      ProjectPhoto(
          url:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfWqZMm59i5xb12Ut6RmbbdTeNOr9GtIvlnQ&sg',
          top: screenHeight * allShapesTop,
          left: -20,
          right: 0,
          screenHeight: screenHeight,
          screenWidth: screenWidth)
    ];

    List<Widget> stackChildren = logic.isFirstOnTop.value
        ? projectPhotos
        : projectPhotos.reversed.toList();

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
          padding: const EdgeInsets.all(pagePadding),
          child: Stack(
            children: [
              CustomPaint(
                painter: RightToLeftShapes(
                  bottomShapeColor: Theme.of(context).colorScheme.primary,
                  topShapeColor: Theme.of(context).colorScheme.primaryContainer,
                  leftModifier: projectShapeLeft,
                  rightModifier: projectShapeRight,
                  bottomModifier: projectShapeBottom,
                ),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: screenWidth,
                ),
              ),
              Positioned(
                left: screenWidth * 0.08,
                child: GestureDetector(
                  onTap: () =>
                      logic.isFirstOnTop.value = !logic.isFirstOnTop.value,
                  // onDoubleTap: ,
                  child: SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.55,
                      child: Stack(children: stackChildren)),
                ),
              ),
              Positioned(
                top: screenHeight * 0.12,
                left: screenWidth * 0.62,
                child: IconButton(
                    onPressed: () =>
                        logic.isFirstOnTop.value = !logic.isFirstOnTop.value,
                    icon: Icon(Icons.screen_rotation_alt_rounded, size: 25)),
              ),
              Positioned(
                  top: screenHeight * 0.22,
                  right: screenWidth * 0.01,
                  child: Column(
                    children: [
                      Card(
                        color:
                            Theme.of(context).colorScheme.surfaceContainerLow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(
                                detailRoundedCorners)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text('Progress',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // spacing: 10,
                        children: [
                          Row(
                            children: [
                              Text('Not started'),
                              Checkbox(
                                value: true,
                                onChanged: (bool? value) {},
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('Started'),
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('Finished'),
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Positioned(
                top: screenHeight * projectShapeBottom + rowsPaddingTop,
                left: pagePadding * 2.5,
                child: SizedBox(
                  width: screenWidth * 0.25,
                  height: screenHeight * (1 - projectShapeBottom) -
                      rowsPaddingTop / 2,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final double columnHeight =
                          constraints.maxHeight - 4 * gapBetweenRows;
                      return Column(
                        spacing: gapBetweenRows,
                        children: [
                          SizedBox(
                            height: columnHeight * 0.25,
                            child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text('Yarn',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                          ),
                          SizedBox(
                            height: columnHeight * 0.1,
                            child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text('Hooks',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                          ),
                          SizedBox(
                            height: columnHeight * 0.25,
                            child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text('Counters',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                          ),
                          SizedBox(
                            height: columnHeight * 0.4,
                            child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text('Notes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * projectShapeBottom + rowsPaddingTop,
                left: screenWidth * projectShapeLeft + itemsPadding,
                right: 0,
                child: SizedBox(
                  height: screenHeight * (1 - projectShapeBottom) -
                      rowsPaddingTop / 2,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final double columnHeight =
                          constraints.maxHeight - 4 * gapBetweenRows;
                      return Column(
                        spacing: gapBetweenRows,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: columnHeight * 0.25,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  for (int i = 1; i <= 5; i++)
                                    if (i.isEven)
                                      YarnItem(name: 'random yarn $i')
                                    else
                                      YarnItem(name: 'longer random yarn $i')
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: columnHeight * 0.1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  for (int i = 1; i <= 5; i++)
                                    HookItem(size: i.toDouble()),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: columnHeight * 0.25,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  for (int i = 1; i <= 5; i++)
                                    if (i.isEven)
                                      CounterItem(
                                          name: 'random counter $i',
                                          value: i * 10)
                                    else
                                      CounterItem(name: ' counter $i', value: i)
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: columnHeight * 0.4,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  // IconButton.filled(
                                  //     onPressed: () {}, icon: Icon(Icons.add)),
                                  for (int i = 1; i <= 5; i++)
                                    NoteItem(
                                        content: 'this\nis\nnote\nnumber\n\n$i')
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
