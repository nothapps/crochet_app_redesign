import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverStack(
      children: [
        SliverPinnedHeader(
          child: Container(
            height: navBarHeight / 2,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        SliverAppBar(
          title: Text('Projects'),
          centerTitle: true,
          floating: true,
          pinned: true,
          snap: false,
          expandedHeight: kToolbarHeight * 2.2,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(30)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.account_circle)),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, kToolbarHeight * 1.5),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: SizedBox(
                        height: 40,
                        child: SearchBar(
                          leading: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
