import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/core/routes/routes.dart';

class HomeAppBarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  const HomeAppBarWidget({super.key, required this.scaffoldKey, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 95.h,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 5.0,top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.mainColor,
                      size: 35.sp,
                    ),
                  ),
                  SizedBox(width: 95.w),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context,Routes.search);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          );
  }
}