import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/calendar_map.dart';
import '../widgets/calendar_view_selector.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String currentView = 'Year'; // Default to Year view

  void changeView(String view) {
    setState(() {
      currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Calendar'),
      body: Column(
        children: [
          CalendarViewSelector(
            currentView: currentView,
            onViewChange: changeView,
          ),
          Expanded(
            child: CalendarMap(view: currentView),
          ),
        ],
      ),
    );
  }
}
