import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEAF5FF),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Color(0xFF2196F3).withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Stack(
        children: [

          // Decorative glowing circle
          Positioned(
            right: -25,
            top: -25,
            child: Container(
              width: 100,
              height: 100,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Color(0xFF2196F3).withOpacity(0.08),

                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2196F3).withOpacity(0.12),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // Small status indicator
              Row(
                children: [

                  Container(
                    width: 10,
                    height: 10,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2196F3),

                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF2196F3).withOpacity(0.6),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8),

                  Text(
                    "LET'S GET MOVING",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              Text(
                "Good Morning 👋",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0),
                ),
              ),

              SizedBox(height: 6),

              Text(
                "Ready to make today count?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}