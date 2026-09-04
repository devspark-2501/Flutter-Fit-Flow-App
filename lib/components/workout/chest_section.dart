import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChestSection extends StatelessWidget {
  const ChestSection({super.key});

  final List<Map<String, dynamic>> exercises = const [
    {
      "name": "Barbell Bench Press",
      "target": "Mid & Lower Chest",
      "video": "assets/workout/chest/chest_bench_press.mp4",
      "form": "Keep feet flat on the floor, arch lower back slightly, and lower bar to mid-chest.",
      "benefits": "Builds overall chest mass, shoulder stability, and pushing power.",
    },
    {
      "name": "Incline Dumbbell Press",
      "target": "Upper Chest",
      "video": "assets/workout/chest/chest_incline_dumbbell.mp4",
      "form": "Set bench to 30 degrees, press dumbbells upward without locking elbows.",
      "benefits": "Fills out upper pecs and improves shoulder mobility.",
    },
    {
      "name": "Cable Flyes",
      "target": "Inner & Outer Chest",
      "video": "assets/workout/chest/chest_cable_fly.mp4",
      "form": "Maintain a slight bend in elbows and squeeze chest at center.",
      "benefits": "Provides constant tension across the full chest range of motion.",
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
          form: item["form"]!,
          benefits: item["benefits"]!,
        );
      }).toList(),
    );
  }
}

class ExerciseCard extends StatefulWidget {
  final String name;
  final String target;
  final String videoPath;
  final String form;
  final String benefits;

  const ExerciseCard({
    super.key,
    required this.name,
    required this.target,
    required this.videoPath,
    required this.form,
    required this.benefits,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
          _controller.setVolume(0.0);
          _controller.setLooping(true);
          _controller.play();
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            _hasError = true;
          });
        }
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
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(12),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            width: 80,
            height: 80,
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
              child: _hasError
                  ? Icon(Icons.broken_image, color: Colors.grey[400])
                  : SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          title: Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: theme.colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            "Target: ${widget.target}",
            style: TextStyle(
              fontSize: 13,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          children: [
            const Divider(),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.fitness_center, size: 18, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Form Tip: ${widget.form}",
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.stars, size: 18, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Benefits: ${widget.benefits}",
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}