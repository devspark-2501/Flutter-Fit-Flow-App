import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

// import '../../components/home/welcome_section.dart';
// import '../../components/home/daily_workout_card.dart';
// import '../../components/home/quick_actions.dart';
// import '../../components/home/progress_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "FitFlow",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      drawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            //WelcomeSection(),

            SizedBox(height: 20),

            //DailyWorkoutCard(),

            SizedBox(height: 20),

            //QuickActions(),

            SizedBox(height: 20),

            //ProgressCard(),
          ],
        ),
      ),
    );
  }
}