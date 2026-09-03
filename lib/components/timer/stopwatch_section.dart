import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchSection extends StatefulWidget {
  const StopwatchSection({super.key});

  @override
  State<StopwatchSection> createState() => _StopwatchSectionState();
}

class _StopwatchSectionState extends State<StopwatchSection> {
  Timer? _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  void _start() {
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() => _milliseconds += 10);
    });
  }

  void _pause() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _reset() {
    _pause();
    setState(() => _milliseconds = 0);
  }

  String _formatTime(int ms) {
    final mins = ((ms ~/ 60000) % 60).toString().padLeft(2, '0');
    final secs = ((ms ~/ 1000) % 60).toString().padLeft(2, '0');
    final hundredths = ((ms % 1000) ~/ 10).toString().padLeft(2, '0');
    return "$mins:$secs.$hundredths";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatTime(_milliseconds),
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.large(
                backgroundColor: primary,
                onPressed: _isRunning ? _pause : _start,
                child: Icon(
                  _isRunning ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 36,
                icon: const Icon(Icons.refresh),
                onPressed: _reset,
              ),
            ],
          ),
        ],
      ),
    );
  }
}