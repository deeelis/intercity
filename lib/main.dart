import 'package:flutter/material.dart';
import 'package:intercity/cup_screen.dart';
import 'package:intercity/details_screen.dart';
import 'package:intercity/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case '/cup':
            return MaterialPageRoute(builder: (context) => const CupScreen());
          case '/details':
            return MaterialPageRoute(
                builder: (context) => const DetailsScreen());
        }
        return null;
      },
    );
  }
}
