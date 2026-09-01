import 'package:flutter/material.dart';

class DailyWorkoutCard extends StatelessWidget {
  DailyWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1565C0),
            Color(0xFF2196F3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Color(0xFF2196F3).withOpacity(0.30),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 8),
          ),
        ],
      ),

      child: Stack(
        children: [

          // Decorative circle
          Positioned(
            right: -35,
            top: -35,

            child: Container(
              width: 130,
              height: 130,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),

          // Another decorative circle
          Positioned(
            right: 30,
            bottom: -70,

            child: Container(
              width: 150,
              height: 150,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // Top row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Row(
                    children: [

                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),

                      SizedBox(width: 12),

                      Text(
                        "TODAY'S WORKOUT",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  Icon(
                    Icons.more_horiz,
                    color: Colors.white70,
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Workout name
              Text(
                "Full Body Workout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              Text(
                "Build strength and stay active.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 18),

              // Workout information
              Row(
                children: [

                  _infoItem(
                    Icons.timer_outlined,
                    "30 min",
                  ),

                  SizedBox(width: 20),

                  _infoItem(
                    Icons.local_fire_department_outlined,
                    "250 kcal",
                  ),

                  SizedBox(width: 20),

                  _infoItem(
                    Icons.signal_cellular_alt,
                    "Beginner",
                  ),
                ],
              ),

              SizedBox(height: 22),

              // Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    "Today's progress",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),

                  Text(
                    "0 / 6 exercises",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: LinearProgressIndicator(
                  value: 0,

                  minHeight: 7,

                  backgroundColor: Colors.white.withOpacity(0.2),

                  valueColor: AlwaysStoppedAnimation(
                    Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Start button
              SizedBox(
                width: double.infinity,
                height: 48,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF1565C0),

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Icon(
                        Icons.play_arrow,
                        size: 22,
                      ),

                      SizedBox(width: 6),

                      Text(
                        "Start Workout",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(
      IconData icon,
      String text,
      ) {
    return Row(
      children: [

        Icon(
          icon,
          color: Colors.white70,
          size: 17,
        ),

        SizedBox(width: 5),

        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}