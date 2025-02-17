import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mora_app/core/constants/app_colors.dart';
import '../core/utils/device_utils.dart';
import '../presentation/screens/calendar_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/projects_screen.dart';
import '../presentation/screens/setting_screen.dart';
import '../presentation/widgets/add_folder_bottom_sheet.dart';
import '../presentation/widgets/add_task_bottom_sheet.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  _HomePageWrapperState createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  final GlobalKey _fabKey = GlobalKey(); // مفتاح لتعقب موقع الزر
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
            iconSize: isTablet ? 34.r : 22.r,
            selectedFontSize: isTablet ? 20.sp : 16.sp,
            unselectedFontSize: isTablet ? 18.sp : 14.sp,
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
                key: _fabKey,
                // تعيين المفتاح هنا
                onPressed: () {
                  final RenderBox renderBox =
                      _fabKey.currentContext!.findRenderObject() as RenderBox;
                  final Offset offset = renderBox.localToGlobal(Offset.zero);

                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(offset.dx, offset.dy - 115,
                        offset.dx - (isTablet ? 70 : 30), offset.dy),
                    items: [
                      PopupMenuItem(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.all(12.r),
                                  child: AddFolderBottomSheet(),
                                );
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Folder",
                              style: TextStyle(
                                fontSize: isTablet ? 22.sp : 18.sp,
                              ),
                            ),
                            Icon(
                              Icons.folder,
                              size: isTablet ? 25.sp : 22.sp,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.all(12.r),
                                  child: AddTaskBottomSheet(),
                                );
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Task",
                              style: TextStyle(
                                fontSize: isTablet ? 22.sp : 18.sp,
                              ),
                            ),
                            Icon(
                              Icons.task,
                              size: isTablet ? 25.sp : 22.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: isTablet ? 38.r : 27.r,
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
      icon: Icon(
        icon,
        // size: isTablet ? 32.r : 20.r,
      ),
      label: label,
    );
  }
}
