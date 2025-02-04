import 'package:flutter/material.dart';
import '../core/utils/device_utils.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  _HomePageWrapperState createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  late bool isTablet; // متغير لتخزين نوع الجهاز

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // يتم حسابها مرة واحدة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
