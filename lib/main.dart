import 'package:big_project/pages/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(QuranApp());
}


class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuranHomePage(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
          boldText: false,
        ),
        child: ScrollConfiguration(
            behavior: const ScrollBehavior(), child: child ?? const Scaffold()
        ),
      ),
    );
  }
}
