import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/core/routes/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
              ),
              child: Center(
                child: Text(
                  'News App!',
                  style: TextStyle(color: Colors.white, fontSize: 28.sp),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.categories);
              },
              child: ListTile(title: Text('Categories', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)))),
            ListTile(title: Text('Settings', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold))),
          ],
        ),
      );
  }
}