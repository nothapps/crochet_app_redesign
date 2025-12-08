import 'package:crochet_app_redesign/utils/constants.dart';
import 'package:flutter/material.dart';

class YarnItem extends StatelessWidget {
  const YarnItem({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double columnHeight = constraints.maxHeight;

        return Column(
          children: [
            Icon(Icons.sports_volleyball,
                size: columnHeight * 0.5,
                color: Theme.of(context).colorScheme.primary),
            SizedBox(
              width: 110,
              child: Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadiusGeometry.circular(detailRoundedCorners)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Center(
                    child: Text(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class HookItem extends StatelessWidget {
  const HookItem({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(detailRoundedCorners)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              '$size mm',
            ),
          ),
        ),
      ),
    );
  }
}

class CounterItem extends StatelessWidget {
  const CounterItem({super.key, required this.name, required this.value});

  final String name;
  final int value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double columnHeight = constraints.maxHeight;

        return Column(
          children: [
            SizedBox(
                height: columnHeight * 0.5,
                width: columnHeight * 0.5,
                child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    shape: CircleBorder(),
                    child: Center(
                        child: SizedBox(
                      child: Text('$value',
                          style: TextStyle(
                              fontSize: columnHeight * 0.15,
                              color: Theme.of(context).colorScheme.surface)),
                    )))),
            SizedBox(
              width: 110,
              child: Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadiusGeometry.circular(detailRoundedCorners)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Center(
                    child: Text(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;

        return SizedBox(
          width: 135,
          height: maxHeight,
          child: Card(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusGeometry.circular(detailRoundedCorners)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                content,
              ),
            ),
          ),
        );
      },
    );
  }
}
