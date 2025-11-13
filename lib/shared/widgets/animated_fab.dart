import 'package:crochet_app_redesign/shared/logic/animated_fab_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedFAB extends HookWidget {
  const AnimatedFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AnimatedFABLogic logic = AnimatedFABLogic();

    return FloatingActionButton(
        onPressed: () {
          logic.rotate();
        },
        shape: const CircleBorder(),
        child: AnimatedRotation(
            turns: logic.turns.value,
            duration: const Duration(milliseconds: 200),
            child: Icon(Icons.add, size: 35)));
  }
}
