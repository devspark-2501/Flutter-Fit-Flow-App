import 'package:flutter/material.dart';
import 'chest_section.dart'; // Imports the shared ExerciseCard & Modal

class ArmsSection extends StatelessWidget {
  const ArmsSection({super.key});

  final List<Map<String, String>> exercises = const [
    {
      "name": "Barbell Bicep Curl",
      "target": "Biceps Brachii",
      "video": "assets/workout/arms/arms_bicep_curl.mp4",
      "form": "Keep elbows tucked to your sides; curl barbell up smoothly without swinging momentum.",
      "benefits": "Maximizes bicep peak height and arm pulling strength.",
    },
    {
      "name": "Cable Tricep Pushdown",
      "target": "Triceps (Lateral & Medial Heads)",
      "video": "assets/workout/arms/arms_tricep_pushdown.mp4",
      "form": "Pin elbows against torso; push cable down fully and flex triceps at extension.",
      "benefits": "Isolates triceps for arm thickness and lockout power.",
    },
    {
      "name": "Dumbbell Hammer Curl",
      "target": "Brachialis & Forearms",
      "video": "assets/workout/arms/arms_hammer_curl.mp4",
      "form": "Grip dumbbells with neutral palms facing inward; curl up toward shoulders.",
      "benefits": "Develops forearm thickness and widens overall arm appearance.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: exercises.map((item) => ExerciseCard(exercise: item)).toList(),
    );
  }
}