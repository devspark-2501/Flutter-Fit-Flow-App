import 'package:fitflow/Screens/%20home/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:fitflow/screens/home/home_page.dart';

void main() {
  runApp(FitFlowCode());
}

class FitFlowCode extends StatelessWidget {
  FitFlowCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F9FF),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2196F3),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1565C0),
          elevation: 0,
        ),
      ),

      home: HomePage()
    );
  }
}