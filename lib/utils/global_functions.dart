import 'package:flutter/material.dart';

Future<T?> goTo<T>(BuildContext context, Widget page) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => page));
}
