import 'package:flutter/widgets.dart';

class DeviceUtils {
  static bool isTablet(BuildContext context) {
    final data = MediaQuery.of(context);
    final double deviceWidth = data.size.shortestSide;
    return deviceWidth > 600; // أي جهاز عرضه أكبر من 600 يعتبر تابلت
  }
}
