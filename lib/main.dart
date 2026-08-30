import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';

void main() {
  runApp(FitFlowCode());
}

class FitFlowCode extends StatelessWidget {
  FitFlowCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}