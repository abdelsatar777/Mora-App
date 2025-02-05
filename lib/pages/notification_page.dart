import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/device_utils.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late bool isTablet; // Variable to store device type

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: isTablet ? 22.w : 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 30.r : 25.r,
            ),
          ),
        ),
        title: Text(
          'NOTIFICATION',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.w),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Notification Page'),
      ),
    );
  }
}
