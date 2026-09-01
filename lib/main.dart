import 'package:fitflow/Screens/%20home/home_page.dart';
import 'package:flutter/material.dart';

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