import 'objectbox.g.dart';

late final Store store;

Future<void> initObjectBox() async {
  store = await openStore();
}
