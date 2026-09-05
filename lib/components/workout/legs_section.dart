import 'package:flutter/material.dart';
import 'chest_section.dart'; // Imports the shared ExerciseCard & Modal

class LegsSection extends StatelessWidget {
  const LegsSection({super.key});

  final List<Map<String, String>> exercises = const [
    {
      "name": "Barbell Back Squat",
      "target": "Quadriceps & Glutes",
      "video": "assets/workout/legs/legs_barbell_squat.mp4",
      "form": "Keep chest high, push knees slightly outward, and squat down to parallel or lower.",
      "benefits": "Primary compound movement for complete lower body mass and strength.",
    },
    {
      "name": "Romanian Deadlift",
      "target": "Hamstrings & Glutes",
      "video": "assets/workout/legs/legs_romanian_deadlift.mp4",
      "form": "Hinge hips back while keeping soft knees; lower barbell along shins until stretch is felt.",
      "benefits": "Targets posterior chain and strengthens hip hinge mechanics.",
    },
    {
      "name": "Standing Calf Raises",
      "target": "Calves (Gastrocnemius)",
      "video": "assets/workout/legs/legs_calf_raises.mp4",
      "form": "Drive through balls of feet to full elevation, pause at top, and stretch lower heel fully.",
      "benefits": "Builds lower leg stability, ankle power, and calf muscle definition.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: exercises.map((item) => ExerciseCard(exercise: item)).toList(),
    );
  }
}