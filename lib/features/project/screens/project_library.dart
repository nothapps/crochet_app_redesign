import 'package:crochet_app_redesign/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProjectLibrary extends StatelessWidget {
  const ProjectLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight * 2.5),
        child: CustomAppBar(),
      ),
    );
  }
}
