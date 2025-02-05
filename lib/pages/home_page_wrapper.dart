import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mora_app/core/constants/app_colors.dart';
import '../core/utils/device_utils.dart';
import '../presentation/screens/calendar_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/projects_screen.dart';
import '../presentation/screens/setting_screen.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  _HomePageWrapperState createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  late bool isTablet; // Variable to store device type

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isTablet = DeviceUtils.isTablet(context); // It is calculated once.
  }

  int _currentIndex = 0;

  final List<Widget> _screens = [
     HomeScreen(),
     CalendarScreen(),
     ProjectsScreen(),
     SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            items: [
              _buildBottomNavItem(Icons.home, "Home", 0),
              _buildBottomNavItem(Icons.calendar_today, "Calendar", 1),
              _buildBottomNavItem(Icons.folder, "Projects", 2),
              _buildBottomNavItem(Icons.settings, "Settings", 3),
            ],
          ),
          Positioned(
            top: isTablet ? -40 : -20,
            left: MediaQuery.of(context).size.width / 2 - 22,
            child: SizedBox(
              width: isTablet ? 55.w : 47.w,
              height: isTablet ? 55.w : 47.h,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: isTablet ? 37.r : 27.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
