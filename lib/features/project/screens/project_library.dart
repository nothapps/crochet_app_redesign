import 'package:crochet_app_redesign/features/project/screens/widgets/project_tile.dart';
import 'package:crochet_app_redesign/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectLibrary extends StatelessWidget {
  const ProjectLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight * 2.5),
          child: CustomAppBar(),
        ),
        body: MasonryGridView.builder(
            gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0), child: ProjectTile());
            }));
  }
}
