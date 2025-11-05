import 'package:flutter_hooks/flutter_hooks.dart';

class NavBarLogic {
  final currentPageIndex = useState<int>(0);

  void changeIndex(int index) {
    currentPageIndex.value = index;
  }
}
