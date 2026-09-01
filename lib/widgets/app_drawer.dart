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
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [

            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    primary,
                    primary.withOpacity(0.75),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.fitness_center,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 14),

                  Text(
                    "FITFLOW",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),

                  Text(
                    "Your Fitness Journey",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // Main menu
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                children: [
                  ...menuItems.map(
                        (item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          leading: Icon(item["icon"], color: primary),
                          title: Text(
                            item["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          onTap: () {
                            Navigator.pop(context);

                            // We will add page navigation here later.
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Divider(indent: 16, endIndent: 16),

            // Bottom options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    leading: Icon(Icons.person, color: primary),
                    title: Text("Profile"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    leading: Icon(Icons.settings, color: primary),
                    title: Text("Settings"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}