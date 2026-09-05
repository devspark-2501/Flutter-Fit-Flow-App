import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChestSection extends StatelessWidget {
  const ChestSection({super.key});

  final List<Map<String, String>> exercises = const [
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
      children: exercises.map((item) => ExerciseCard(exercise: item)).toList(),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Map<String, String> exercise;

  const ExerciseCard({super.key, required this.exercise});

  void _showVideoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => VideoPlayerModal(
        videoPath: exercise["video"]!,
        title: exercise["name"]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(16),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.fitness_center_rounded, color: primaryColor, size: 24),
          ),
          title: Text(
            exercise["name"]!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: theme.colorScheme.onSurface,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                exercise["target"]!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          children: [
            const Divider(),
            const SizedBox(height: 8),

            // Watch Video Trigger Card
            InkWell(
              onTap: () => _showVideoModal(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, primaryColor.withOpacity(0.85)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_circle_fill, color: Colors.white, size: 22),
                    SizedBox(width: 8),
                    Text(
                      "Watch Exercise Video",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Form Tip
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_outline_rounded, size: 20, color: primaryColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Form Tip: ${exercise['form']}",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Benefits
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star_outline_rounded, size: 20, color: primaryColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Benefits: ${exercise['benefits']}",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
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

// Reusable Smooth Video Modal Player
class VideoPlayerModal extends StatefulWidget {
  final String videoPath;
  final String title;

  const VideoPlayerModal({
    super.key,
    required this.videoPath,
    required this.title,
  });

  @override
  State<VideoPlayerModal> createState() => _VideoPlayerModalState();
}

class _VideoPlayerModalState extends State<VideoPlayerModal> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        if (mounted) {
          setState(() => _isInitialized = true);
          _controller.setLooping(true);
          _controller.play();
        }
      }).catchError((_) {
        if (mounted) setState(() => _hasError = true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: _isInitialized ? _controller.value.aspectRatio : 16 / 9,
              child: _isInitialized
                  ? VideoPlayer(_controller)
                  : Center(
                child: _hasError
                    ? const Text("Video failed to load", style: TextStyle(color: Colors.white70))
                    : const CircularProgressIndicator(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_isInitialized)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 48,
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying ? _controller.pause() : _controller.play();
                    });
                  },
                ),
              ],
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}