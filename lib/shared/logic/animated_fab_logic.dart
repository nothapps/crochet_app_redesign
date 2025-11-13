import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedFABLogic {
  final ValueNotifier<double> turns = useState(0.0);

  void rotate() {
    turns.value == 0 ? turns.value += 1 / 8 : turns.value = 0;
  }
}
