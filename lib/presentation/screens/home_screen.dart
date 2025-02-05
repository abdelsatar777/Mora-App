import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mora_app/presentation/widgets/custom_app_bar.dart';
import 'package:mora_app/presentation/widgets/custom_date_card.dart';
import 'package:mora_app/presentation/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Column(
          children: [
            CustomSearchBar(),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                    CustomDateCard(
                      day: 'DAY',
                      dayNumber: '00',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
