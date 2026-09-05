import 'package:flutter/material.dart';

class HydrationCalculator extends StatefulWidget {
  final Function(int) onCalculate;

  const HydrationCalculator({super.key, required this.onCalculate});

  @override
  State<HydrationCalculator> createState() => _HydrationCalculatorState();
}

class _HydrationCalculatorState extends State<HydrationCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ageController = TextEditingController(text: '17');
  final TextEditingController _weightController = TextEditingController(text: '59');
  String _activityLevel = 'Moderate';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final int age = int.parse(_ageController.text);
      final double weight = double.parse(_weightController.text);

      // Hydration formula: Weight (kg) * 35 ml + activity bonus
      double baseWater = weight * 35;

      if (_activityLevel == 'High') {
        baseWater += 500;
      } else if (_activityLevel == 'Moderate') {
        baseWater += 250;
      }

      if (age < 18) {
        baseWater += 200; // Extra requirement for growing youth
      }

      // Round to nearest 100 ml
      final int recommendedGoal = (baseWater / 100).round() * 100;
      widget.onCalculate(recommendedGoal);
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = Colors.blueAccent;

    return Container(
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calculate_rounded, color: primaryColor, size: 24),
                const SizedBox(width: 10),
                Text(
                  'Hydration Goal Calculator',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),

            // Age Field
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age (Years)',
                prefixIcon: Icon(Icons.person_outline, color: primaryColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Please enter age';
                if (int.tryParse(val) == null) return 'Enter a valid number';
                return null;
              },
            ),

            const SizedBox(height: 14),

            // Weight Field
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                prefixIcon: Icon(Icons.scale_outlined, color: primaryColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Please enter weight';
                if (double.tryParse(val) == null) return 'Enter a valid number';
                return null;
              },
            ),

            const SizedBox(height: 14),

            // Activity Level Dropdown
            DropdownButtonFormField<String>(
              value: _activityLevel,
              decoration: InputDecoration(
                labelText: 'Daily Activity Level',
                prefixIcon: Icon(Icons.fitness_center_rounded, color: primaryColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: const [
                DropdownMenuItem(value: 'Low', child: Text('Low (Sedentary)')),
                DropdownMenuItem(value: 'Moderate', child: Text('Moderate (30m Workout)')),
                DropdownMenuItem(value: 'High', child: Text('High (Intense Exercise)')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _activityLevel = val);
              },
            ),

            const SizedBox(height: 20),

            // Calculate Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Calculate Target Intake',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}