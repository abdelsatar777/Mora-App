import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/device_utils.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late bool isTablet;
  late TabController _tabController;

  List<Map<String, dynamic>> notifications = [
    {'title': 'Client Meeting', 'time': '1m ago', 'isRead': false},
    {'title': 'Client Meeting', 'time': '1m ago', 'isRead': true},
    {'title': 'Client Meeting', 'time': '1m ago', 'isRead': false},
    {'title': 'Client Meeting', 'time': '1m ago', 'isRead': true},
    {'title': 'Client Meeting', 'time': '1m ago', 'isRead': false},
    {'title': 'Client Meeting', 'time': '1m ago', 'isRead': true},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context);
  }

  List<Map<String, dynamic>> getFilteredNotifications(int index) {
    if (index == 1) {
      return notifications.where((notif) => !notif['isRead']).toList();
    } else if (index == 2) {
      return notifications.where((notif) => notif['isRead']).toList();
    }
    return notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('NOTIFICATION'),
        titleTextStyle: TextStyle(
          fontSize: isTablet ? 32.sp : 22.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.w,
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.brown,
          labelStyle: TextStyle(
            fontSize: isTablet ? 32.sp : 20.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(text: "All"),
            Tab(text: "Unread"),
            Tab(text: "Read"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(3, (index) {
          var filteredList = getFilteredNotifications(index);
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: filteredList.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Icon(
                  Icons.circle,
                  size: 20.r,
                  color: filteredList[i]['isRead'] ? Colors.grey : Colors.brown,
                ),
                title: Text(
                  filteredList[i]['title'],
                  style: TextStyle(
                    fontSize: isTablet ? 32.sp : 22.sp,
                    fontWeight: filteredList[i]['isRead']
                        ? FontWeight.normal
                        : FontWeight.bold,
                  ),
                ),
                subtitle: Text(filteredList[i]['time']),
              );
            },
          );
        }),
      ),
    );
  }
}
