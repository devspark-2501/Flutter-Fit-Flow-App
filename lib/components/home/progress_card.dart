import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          "Weekly Progress",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Your activity summary this week",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 15),

        // Main Progress Container
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
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
            children: [
              // Metric Overview Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statTile(
                    icon: Icons.local_fire_department,
                    value: "1,850",
                    unit: "kcal",
                    label: "Burned",
                    color: Colors.orange,
                  ),
                  _divider(),
                  _statTile(
                    icon: Icons.timer_outlined,
                    value: "140",
                    unit: "mins",
                    label: "Active Time",
                    color: Color(0xFF2196F3),
                  ),
                  _divider(),
                  _statTile(
                    icon: Icons.check_circle_outline,
                    value: "4/5",
                    unit: "days",
                    label: "Completed",
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(color: Color(0xFFE3F2FD), thickness: 1),
              SizedBox(height: 15),

              // Weekly Activity Bar Graph Representation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _dayBar("Mon", 0.6, false),
                  _dayBar("Tue", 0.85, false),
                  _dayBar("Wed", 0.4, false),
                  _dayBar("Thu", 0.95, true), // Active/Today
                  _dayBar("Fri", 0.2, false),
                  _dayBar("Sat", 0.0, false),
                  _dayBar("Sun", 0.0, false),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statTile({
    required IconData icon,
    required String value,
    required String unit,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        SizedBox(height: 6),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              TextSpan(
                text: " $unit",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      height: 35,
      width: 1,
      color: Color(0xFFE3F2FD),
    );
  }

  Widget _dayBar(String day, double heightFactor, bool isToday) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 12,
          decoration: BoxDecoration(
            color: Color(0xFFF5F9FF),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomCenter,
          child: FractionalTranslation(
            translation: Offset(0, 0),
            child: Container(
              height: 60 * heightFactor,
              width: 12,
              decoration: BoxDecoration(
                gradient: isToday
                    ? LinearGradient(
                  colors: [
                    Color(0xFF1565C0),
                    Color(0xFF2196F3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
                    : null,
                color: isToday ? null : Color(0xFF90CAF9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          day,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            color: isToday ? Color(0xFF1565C0) : Colors.grey[600],
          ),
        ),
      ],
    );
  }
}