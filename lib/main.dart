import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mora_app/pages/home_page_wrapper.dart';
import 'core/utils/device_utils.dart';

void main() {
  runApp(MoraApp());
}

class MoraApp extends StatelessWidget {
  const MoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          DeviceUtils.isTablet(context) ? Size(800, 1280) : Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Funnel Display',
            scaffoldBackgroundColor: Colors.white,
          ),
          home: HomePageWrapper(),
        );
      },
    );
  }
}
