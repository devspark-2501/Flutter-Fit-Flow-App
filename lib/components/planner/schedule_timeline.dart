import 'package:flutter/material.dart';

class ScheduleTask {
  final String id;
  final String time;
  final String title;
  final String category;
  final IconData icon;
  bool isCompleted;

  ScheduleTask({
    required this.id,
    required this.time,
    required this.title,
    required this.category,
    required this.icon,
    this.isCompleted = false,
  });
}

class ScheduleTimeline extends StatelessWidget {
  final List<ScheduleTask> tasks;
  final Function(String id) onToggleTask;
  final Function(String id) onDeleteTask;

  const ScheduleTimeline({
    super.key,
    required this.tasks,
    required this.onToggleTask,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    if (tasks.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFDDEBFA)),
        ),
        child: Column(
          children: [
            Icon(
              Icons.event_available_rounded,
              size: 48,
              color: primaryColor.withOpacity(0.4),
            ),
            const SizedBox(height: 12),
            Text(
              "No schedules added yet!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Tap 'Add' above to start planning your day.",
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final isLast = index == tasks.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Timeline Indicator
            Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: task.isCompleted
                        ? Colors.grey[400]
                        : primaryColor,
                    border: Border.all(
                      color: task.isCompleted
                          ? Colors.grey[300]!
                          : const Color(0xFFEAF5FF),
                      width: 3,
                    ),
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 70,
                    color: primaryColor.withOpacity(0.2),
                  ),
              ],
            ),
            const SizedBox(width: 14),

            // Schedule Item Card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: task.isCompleted
                        ? const Color(0xFFF8FAFC)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: task.isCompleted
                          ? Colors.grey[300]!
                          : const Color(0xFFDDEBFA),
                    ),
                    boxShadow: task.isCompleted
                        ? []
                        : [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Category Icon Box
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: task.isCompleted
                              ? Colors.grey[200]
                              : const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          task.icon,
                          color: task.isCompleted
                              ? Colors.grey[500]
                              : primaryColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Task Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.time,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: task.isCompleted
                                    ? Colors.grey[500]
                                    : primaryColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              task.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: task.isCompleted
                                    ? Colors.grey[500]
                                    : const Color(0xFF1A1A1A),
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Checkbox
                      IconButton(
                        icon: Icon(
                          task.isCompleted
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked_rounded,
                          color: task.isCompleted
                              ? Colors.grey[400]
                              : primaryColor,
                          size: 26,
                        ),
                        onPressed: () => onToggleTask(task.id),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}