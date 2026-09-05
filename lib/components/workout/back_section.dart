import 'package:flutter/material.dart';
import 'chest_section.dart'; // Imports the shared ExerciseCard & Modal

class BackSection extends StatelessWidget {
  const BackSection({super.key});

  final List<Map<String, String>> exercises = const [
    {
      "name": "Lat Pulldown",
      "target": "Lats & Upper Back",
      "video": "assets/workout/back/back_lat_pulldown.mp4",
      "form": "Pull bar toward upper chest while keeping torso slightly tilted back; squeeze shoulder blades.",
      "benefits": "Develops V-taper frame and builds upper-body pulling strength.",
    },
    {
      "name": "Barbell Bent-Over Row",
      "target": "Rhomboids & Mid Back",
      "video": "assets/workout/back/back_bent_over_row.mp4",
      "form": "Hinge at hips with a flat back; pull barbell smoothly to lower ribcage.",
      "benefits": "Increases back thickness and improves posterior chain endurance.",
    },
    {
      "name": "Wide-Grip Pull-ups",
      "target": "Full Back & Core",
      "video": "assets/workout/back/back_pullups.mp4",
      "form": "Grip bar wider than shoulder width; pull chest up until chin clears the bar.",
      "benefits": "Unmatched bodyweight back builder for broad lats and grip strength.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: exercises.map((item) => ExerciseCard(exercise: item)).toList(),
    );
  }
}