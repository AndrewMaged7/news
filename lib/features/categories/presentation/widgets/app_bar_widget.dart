import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
    const AppBarWidget({super.key, required this.scaffoldKey});

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
                  // IconButton(
                  //   onPressed: () {
                  //     scaffoldKey.currentState?.openDrawer();
                  //   },
                  //   icon: Icon(
                  //     Icons.menu,
                  //     color: Colors.white,
                  //     size: 35.sp,
                  //   ),
                  // ),
                  // SizedBox(width: 95.w),
                  Text(
                    'News App',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}