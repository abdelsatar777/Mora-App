import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/device_utils.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddFolderBottomSheet extends StatefulWidget {
  const AddFolderBottomSheet({super.key});

  @override
  State<AddFolderBottomSheet> createState() => _AddFolderBottomSheetState();
}

class _AddFolderBottomSheetState extends State<AddFolderBottomSheet> {
  late bool isTablet;
  final TextEditingController _folderController = TextEditingController();

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
          "Add New Folder",
          style: TextStyle(
            fontSize: isTablet ? 24.sp : 22.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: _folderController,
          label: "Name",
          hintText: "Enter Folder Name",
        ),
        SizedBox(height: 16.h),
        CustomButton(title: "Add"),
        SizedBox(height: 14.h),
      ],
    );
  }
}
