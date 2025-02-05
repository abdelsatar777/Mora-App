import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/device_utils.dart';

class CustomDateCard extends StatefulWidget {
  final String day;
  final String dayNumber;

  const CustomDateCard({
    super.key,
    required this.day,
    required this.dayNumber,
  });

  @override
  _CustomDateCardState createState() => _CustomDateCardState();
}

class _CustomDateCardState extends State<CustomDateCard> {
  late bool isTablet; // Variable to store device type

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7.w),
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: AppColors.primary,
          width: 3,
        ),
      ),
      child: Text(
        '${widget.day}\n${widget.dayNumber}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: isTablet ? 18.sp : 16.sp,
        ),
      ),
    );
  }
}
