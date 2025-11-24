import 'package:crochet_app_redesign/objectbox_init.dart';
import 'package:crochet_app_redesign/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initObjectBox();
  runApp(const CrochetApp());
}

class CrochetApp extends StatelessWidget {
  const CrochetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crochet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: SeedColorScheme.fromSeeds(
          primaryKey: Color(0xFFCF6679),
          // primaryKey: const Color(0xFF4F75B8),
          // primaryKey: const Color.fromARGB(255, 188, 69, 192),
          variant: FlexSchemeVariant.candyPop,
          // variant: FlexSchemeVariant.fruitSalad,
        ),
        useMaterial3: true,
      ),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      home: CustomNavBar(),
    );
  }
}
