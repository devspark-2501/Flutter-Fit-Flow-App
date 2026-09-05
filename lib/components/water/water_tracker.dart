import 'package:flutter/material.dart';

class WaterTracker extends StatefulWidget {
  final int dailyGoalMl;
  final VoidCallback onResetGoal;

  const WaterTracker({
    super.key,
    required this.dailyGoalMl,
    required this.onResetGoal,
  });

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int _currentIntakeMl = 0;
  final List<Map<String, String>> _logs = [];

  void _addWater(int amount) {
    setState(() {
      _currentIntakeMl += amount;
      final now = TimeOfDay.now();
      _logs.insert(0, {
        'amount': '+${amount} ml',
        'time': '${now.hourOfPeriod}:${now.minute.toString().padLeft(2, '0')} ${now.period == DayPeriod.am ? 'AM' : 'PM'}',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = Colors.blueAccent;
    final int remainingMl = (widget.dailyGoalMl - _currentIntakeMl).clamp(0, widget.dailyGoalMl);
    final double progress = (_currentIntakeMl / widget.dailyGoalMl).clamp(0.0, 1.0);

    return Column(
      children: [
        // Progress Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primaryColor.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 12,
                      backgroundColor: primaryColor.withOpacity(0.12),
                      color: primaryColor,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '${_currentIntakeMl} / ${widget.dailyGoalMl} ml',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  remainingMl > 0
                      ? 'Wow! Just $remainingMl ml more to reach your daily goal!'
                      : '🎉 Goal achieved! Excellent hydration today!',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Quick Add Buttons
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primaryColor.withOpacity(0.15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log Intake',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAddButton(150, 'Glass (150ml)', Icons.local_drink, primaryColor),
                  _buildAddButton(250, 'Cup (250ml)', Icons.water_drop, primaryColor),
                  _buildAddButton(500, 'Bottle (500ml)', Icons.wine_bar, primaryColor),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // History Log
        if (_logs.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryColor.withOpacity(0.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Registration Log',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    final log = _logs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.water_drop, color: primaryColor, size: 16),
                              const SizedBox(width: 8),
                              Text(log['amount']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Text(log['time']!, style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5), fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAddButton(int amount, String label, IconData icon, Color primaryColor) {
    return GestureDetector(
      onTap: () => _addWater(amount),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 22),
          ),
          const SizedBox(height: 6),
          Text(
            '+$amount ml',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}