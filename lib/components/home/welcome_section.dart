import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          "Good Morning 👋",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),

        SizedBox(height: 6),

        Text(
          "Ready to make today count?",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}