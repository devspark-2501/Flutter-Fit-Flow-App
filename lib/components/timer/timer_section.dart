import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerSection extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const TimerSection({super.key, required this.audioPlayer});

  @override
  State<TimerSection> createState() => _TimerSectionState();
}

class _TimerSectionState extends State<TimerSection> {
  Timer? _timer;
  int _remainingSeconds = 60;
  final int _initialSeconds = 60;
  bool _isRunning = false;

  void _startTimer() {
    if (_remainingSeconds <= 0) return;
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _pauseTimer();
        widget.audioPlayer.play(AssetSource('alarm_sound.mp3'));
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _pauseTimer();
    setState(() => _remainingSeconds = _initialSeconds);
  }

  String _formatTime(int seconds) {
    final mins = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$mins:$secs";
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
            _formatTime(_remainingSeconds),
            style: TextStyle(
              fontSize: 64,
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
                onPressed: _isRunning ? _pauseTimer : _startTimer,
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
                onPressed: _resetTimer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}