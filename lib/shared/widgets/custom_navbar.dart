import 'package:crochet_app_redesign/features/project/screens/project_library.dart';
import 'package:crochet_app_redesign/shared/widgets/custom_navbar_shape.dart';
import 'package:crochet_app_redesign/shared/logic/navbar_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CustomNavBar extends HookWidget {
  CustomNavBar({super.key});

  final List<Widget> pages = [
    ProjectLibrary(),
    Center(child: Text('patterns')),
    Center(child: Text('yarn')),
    Center(child: Text('tools')),
  ];

  @override
  Widget build(BuildContext context) {
    final logic = NavBarLogic();

    return Scaffold(
      body: IndexedStack(
        index: logic.currentPageIndex.value,
        children: pages,
      ),
      bottomNavigationBar:
          Stack(alignment: AlignmentGeometry.bottomCenter, children: [
        CustomNavBarShape(),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            selectedIndex: logic.currentPageIndex.value,
            onDestinationSelected: logic.changeIndex,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.folder), label: 'Projects'),
              Padding(
                padding: const EdgeInsets.only(right: 27),
                child: NavigationDestination(
                    icon: Icon(Icons.pattern), label: 'Patterns'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 27),
                child: NavigationDestination(
                    icon: Icon(Icons.sports_volleyball), label: 'Yarn'),
              ),
              NavigationDestination(
                  icon: Icon(Symbols.measuring_tape, fill: 1), label: 'Tools')
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: Icon(Icons.add, size: 35)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
