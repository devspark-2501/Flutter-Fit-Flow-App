import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),

        SizedBox(height: 5),

        Text(
          "Jump right into your fitness routine",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),

        SizedBox(height: 15),

        Row(
          children: [

            Expanded(
              child: _actionCard(
                icon: Icons.timer_outlined,
                title: "Start Timer",
                subtitle: "Track your workout",
              ),
            ),

            SizedBox(width: 14),

            Expanded(
              child: _actionCard(
                icon: Icons.water_drop_outlined,
                title: "Log Water",
                subtitle: "Stay hydrated",
              ),
            ),
          ],
        ),

        SizedBox(height: 14),

        Row(
          children: [

            Expanded(
              child: _actionCard(
                icon: Icons.calendar_month_outlined,
                title: "Today's Plan",
                subtitle: "View your schedule",
              ),
            ),

            SizedBox(width: 14),

            Expanded(
              child: _actionCard(
                icon: Icons.fitness_center_outlined,
                title: "Exercises",
                subtitle: "Explore exercises",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: Color(0xFFDDEBFA),
        ),

        boxShadow: [
          BoxShadow(
            color: Color(0xFF2196F3).withOpacity(0.08),
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE3F2FD),
                  Color(0xFFF5F9FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.circular(15),

              boxShadow: [
                BoxShadow(
                  color: Color(0xFF2196F3).withOpacity(0.12),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),

            child: Icon(
              icon,
              color: Color(0xFF2196F3),
              size: 25,
            ),
          ),

          SizedBox(height: 14),

          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),

          SizedBox(height: 4),

          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),

          SizedBox(height: 12),

          Row(
            children: [

              Text(
                "Open",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),

              SizedBox(width: 4),

              Icon(
                Icons.arrow_forward,
                size: 15,
                color: Color(0xFF2196F3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}