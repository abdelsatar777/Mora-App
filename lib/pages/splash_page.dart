import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mora_app/core/constants/app_colors.dart';
import '../core/utils/device_utils.dart';
import 'home_page_wrapper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late bool isTablet; // Variable to store device type

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  @override
  void initState() {
    super.initState();

    // Add a timer that will expire after 3 seconds.
    Timer(
      Duration(seconds: 5),
      () {
        // Redirect to next page after counter ends
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageWrapper(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/Wallpaper.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: isTablet ? 320.h : 250.h,
            left: isTablet ? 100.h : 50.h,
            right: isTablet ? 100.h : 50.h,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/Logo.png'),
                  height: isTablet ? 200.h : 130.h,
                  width: isTablet ? 380.w : 190.w,
                ),
                // SizedBox(height: 7),
                Text(
                  'MORA',
                  style: TextStyle(
                    fontSize: isTablet ? 45.sp : 35.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: isTablet ? 33.w : 27.w,
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
