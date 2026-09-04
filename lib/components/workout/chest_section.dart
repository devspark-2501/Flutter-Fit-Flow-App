import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChestSection extends StatelessWidget {
  const ChestSection({super.key});

  final List<Map<String, String>> exercises = const [
    {
      "name": "Barbell Bench Press",
      "target": "Mid & Lower Chest",
      "video": "assets/workout/chest/chest_bench_press.mp4",
    },
    {
      "name": "Incline Dumbbell Press",
      "target": "Upper Chest",
      "video": "assets/workout/chest/chest_incline_dumbbell.mp4",
    },
    {
      "name": "Cable Flyes",
      "target": "Inner & Outer Chest",
      "video": "assets/workout/chest/chest_cable_fly.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: exercises.map((item) {
        return ExerciseCard(
          name: item["name"]!,
          target: item["target"]!,
          videoPath: item["video"]!,
        );
      }).toList(),
    );
  }
}

class ExerciseCard extends StatefulWidget {
  final String name;
  final String target;
  final String videoPath;

  const ExerciseCard({
    super.key,
    required this.name,
    required this.target,
    required this.videoPath,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.setVolume(0.0); // Mutes the video audio completely
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Video Preview Box
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: _isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Exercise Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Target: ${widget.target}",
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}