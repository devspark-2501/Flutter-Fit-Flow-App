import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AlarmSection extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const AlarmSection({super.key, required this.audioPlayer});

  @override
  State<AlarmSection> createState() => _AlarmSectionState();
}

class _AlarmSectionState extends State<AlarmSection> {
  TimeOfDay _alarmTime = const TimeOfDay(hour: 7, minute: 0);
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final selected = await showTimePicker(
                    context: context,
                    initialTime: _alarmTime,
                  );
                  if (selected != null) {
                    setState(() => _alarmTime = selected);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Workout Alarm",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _alarmTime.format(context),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _isEnabled,
                activeColor: primary,
                onChanged: (val) {
                  setState(() => _isEnabled = val);
                  if (val) {
                    widget.audioPlayer.play(AssetSource('alarm_sound.mp3'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}