import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/device_utils.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  late bool isTablet;
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _calenderController = TextEditingController();

  // Variable to store device type
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Add New Task",
          style: TextStyle(
            fontSize: isTablet ? 24.sp : 22.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: _taskNameController,
          label: "Name",
          hintText: "Enter Task Name",
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: _calenderController,
          label: "Calendar",
          hintText: "Enter Calendar",
          showIcon: true,
          icon: Icons.calendar_month,
        ),
        SizedBox(height: 16.h),
        CustomButton(title: "Add"),
        SizedBox(height: 14.h),
      ],
    );
  }
}
