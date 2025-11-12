import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: navBarHeight / 2,
          color: Theme.of(context).colorScheme.surface,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: AppBar(
            title: Text('Projects'),
            centerTitle: true,
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
                preferredSize: const Size(double.infinity, kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(
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
        ),
      ],
    );
  }
}
