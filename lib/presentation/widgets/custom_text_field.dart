import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/device_utils.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool showIcon;
  final IconData icon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.showIcon = false,
    this.icon = Icons.numbers,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isTablet;

  // Variable to store device type
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: isTablet ? 20.sp : 18.sp,
            letterSpacing: 2,
          ),
        ),
        TextField(
          controller: widget.controller,
          cursorColor: AppColors.primary,
          cursorWidth: 3,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: isTablet ? 16.sp : 16.sp,
              letterSpacing: 2,
              color: Colors.grey,
            ),
            suffixIcon: widget.showIcon
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      widget.icon,
                      size: isTablet ? 32.r : 26.r,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
