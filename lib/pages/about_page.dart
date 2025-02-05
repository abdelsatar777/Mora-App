import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/utils/device_utils.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late bool isTablet; // Variable to store device type

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
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
            top: isTablet ? 70.h : 35.h,
            left: isTablet ? 50.w : 17.w,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: isTablet ? 40.r : 25.r,
              ),
            ),
          ),
          Positioned(
            top: isTablet ? 80.h : 50.h,
            left: isTablet ? 335.w : 170.w,
            child: Text(
              'About App',
              style: TextStyle(
                color: Colors.white,
                fontSize: isTablet ? 27.sp : 20.sp,
              ),
            ),
          ),
          Positioned(
            top: isTablet ? 320.h : 250.h,
            left: isTablet ? 100.h : 50.h,
            right: isTablet ? 100.h : 50.h,
            child: Column(
              children: [
                Text(
                  'MORA APP',
                  style: TextStyle(
                    fontSize: isTablet ? 40.sp : 22.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: isTablet ? 15.w : 10.w,
                    color: AppColors.whiteText,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Version 1.1',
                  style: TextStyle(
                    fontSize: isTablet ? 27.sp : 14.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: isTablet ? 5.w : 3.w,
                    color: AppColors.whiteText,
                  ),
                ),
                SizedBox(height: 10.h),
                Image(
                  image: AssetImage('assets/images/Logo.png'),
                  height: isTablet ? 150.h : 100.h,
                  width: isTablet ? 330.w : 160.w,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Made by',
                  style: TextStyle(
                    fontSize: isTablet ? 25.sp : 14.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: isTablet ? 5.w : 5.w,
                    color: AppColors.whiteText,
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  'MORA',
                  style: TextStyle(
                    fontSize: isTablet ? 40.sp : 22.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: isTablet ? 17.w : 27.w,
                    color: AppColors.whiteText,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
