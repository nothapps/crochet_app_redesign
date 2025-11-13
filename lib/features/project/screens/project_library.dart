import 'package:crochet_app_redesign/features/project/screens/widgets/project_tile.dart';
import 'package:crochet_app_redesign/shared/widgets/custom_appbar.dart';
import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectLibrary extends StatelessWidget {
  const ProjectLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;
          final int tileWidth = screenWidth < screenHeight ? 150 : 250;
          final int crossAxisCount = (screenWidth / tileWidth).floor();

          return Scaffold(
            extendBodyBehindAppBar: true,
            body: CustomScrollView(
              slivers: [
                CustomAppBar(),
                SliverPadding(
                  padding: EdgeInsets.only(
                      left: 8, right: 8, bottom: navBarHeight * 1.5),
                  sliver: SliverMasonryGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 20,
                      (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              final cutWidth = constraints.maxWidth * 0.3;
                              return ProjectTile(
                                cutWidth: cutWidth,
                              );
                            }));
                        // child: ProjectTile()));
                      },
                    ),
                    gridDelegate:
                        SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: screenWidth / crossAxisCount),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
