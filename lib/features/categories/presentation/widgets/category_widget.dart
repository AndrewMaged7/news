import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final Color backgroundColor;
  final String imageUrl;
  final int index;
  const CategoryWidget({super.key, required this.categoryName, required this.backgroundColor,required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      height: 140.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
          bottomLeft: Radius.circular(index.isEven ? 25.r : 0),
          bottomRight: Radius.circular(index.isOdd ? 25.r : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, width: 121.w, height: 105.h),
          SizedBox(height: 15.h),
          Text(categoryName, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}