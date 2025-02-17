import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mora_app/core/constants/app_colors.dart';
import 'package:mora_app/pages/about_page.dart';
import 'package:mora_app/presentation/widgets/custom_app_bar.dart';

import '../../core/utils/device_utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;

  late bool isTablet; // Variable to store device type

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Setting'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.dark_mode,
                      size: isTablet ? 50.r : 35.r,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.w,
                      ),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 0.7.r,
                  child: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeColor: AppColors.primary,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: isTablet ? 50.r : 35.r,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'About App',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.w,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
