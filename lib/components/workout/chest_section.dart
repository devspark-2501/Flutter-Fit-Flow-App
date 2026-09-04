import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChestSection extends StatelessWidget {
  const ChestSection({super.key});

  final List<Map<String, dynamic>> exercises = const [
    {
      "name": "Barbell Bench Press",
      "target": "Mid & Lower Chest",
      "video": "assets/workout/chest/chest_bench_press.mp4",
      "form": "Keep feet flat on the floor, arch lower back slightly, and lower bar smoothly to mid-chest.",
      "benefits": "Builds overall chest mass, shoulder stability, and core pushing power.",
    },
    {
      "name": "Incline Dumbbell Press",
      "target": "Upper Chest",
      "video": "assets/workout/chest/chest_incline_dumbbell.mp4",
      "form": "Set bench angle to 30 degrees, press dumbbells upward without fully locking elbows.",
      "benefits": "Fills out upper pecs and improves upper-body symmetry.",
    },
    {
      "name": "Cable Flyes",
      "target": "Inner & Outer Chest",
      "video": "assets/workout/chest/chest_cable_fly.mp4",
      "form": "Maintain a slight bend in your elbows and focus on squeezing pecs together at center.",
      "benefits": "Provides constant tension across the full chest motion range.",
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
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.fitness_center, color: primaryColor),
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

            // Large Full-Width Expandable Video Box
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 220),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
              ),
              clipBehavior: Clip.antiAlias,
              child: _isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Center(
                child: _hasError
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.videocam_off,
                        color: Colors.grey[400], size: 32),
                    const SizedBox(height: 6),
                    Text(
                      "Video unavailable",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
                    : CircularProgressIndicator(
                  strokeWidth: 2,
                  color: primaryColor,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Exercise Form & Benefits Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 18, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Form Tip: ${widget.form}",
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface.withOpacity(0.85),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.stars_rounded, size: 18, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Benefits: ${widget.benefits}",
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurface.withOpacity(0.85),
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