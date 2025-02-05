import 'package:flutter/material.dart';

class CalendarMap extends StatelessWidget {
  final String view;

  const CalendarMap({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case 'Day':
        return Center(
          child: Text(
            'Day View',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 'Month':
        return Center(
          child: Text(
            'Month View',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 'Year':
      default:
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, // 7 days in a week
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: 12 * 30, // Simplified example for Year view
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${index + 1}', // Example content
                style: const TextStyle(fontSize: 14),
              ),
            );
          },
        );
    }
  }
}
