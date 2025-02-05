import 'package:flutter/material.dart';

class CalendarViewSelector extends StatelessWidget {
  final String currentView;
  final ValueChanged<String> onViewChange;

  const CalendarViewSelector({
    super.key,
    required this.currentView,
    required this.onViewChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<String>(
        value: currentView,
        onChanged: (String? newValue) {
          if (newValue != null) {
            onViewChange(newValue);
          }
        },
        items: ['Day', 'Month', 'Year']
            .map(
              (view) => DropdownMenuItem(
                value: view,
                child: Text(
                  view,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
            .toList(),
        isExpanded: true,
        underline: Container(
          height: 2,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
