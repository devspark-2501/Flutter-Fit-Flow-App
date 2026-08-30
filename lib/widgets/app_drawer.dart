import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Home",
      "icon": Icons.home,
    },
    {
      "title": "Workouts",
      "icon": Icons.fitness_center,
    },
    {
      "title": "Timer",
      "icon": Icons.timer,
    },
    {
      "title": "Planner",
      "icon": Icons.calendar_month,
    },
    {
      "title": "Progress",
      "icon": Icons.bar_chart,
    },
    {
      "title": "Water",
      "icon": Icons.water_drop,
    },
    {
      "title": "Exercises",
      "icon": Icons.accessibility_new,
    },
    {
      "title": "Challenges",
      "icon": Icons.local_fire_department,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [

            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.fitness_center,
                    size: 40,
                  ),

                  SizedBox(height: 10),

                  Text(
                    "FITFLOW",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Your Fitness Journey",
                  ),
                ],
              ),
            ),

            Divider(),

            // Main menu
            Expanded(
              child: ListView(
                children: [
                  ...menuItems.map(
                        (item) {
                      return ListTile(
                        leading: Icon(item["icon"]),
                        title: Text(item["title"]),

                        onTap: () {
                          Navigator.pop(context);

                          // We will add page navigation here later.
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            Divider(),

            // Bottom options
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}