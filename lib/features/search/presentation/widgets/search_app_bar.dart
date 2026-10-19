import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/features/search/presentation/cubit/search_cubit.dart';

class SearchAppBarWidget extends StatelessWidget {
  final SearchCubit searchCubit;
  const SearchAppBarWidget({super.key, required this.searchCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 45.h),
        child: TextFormField(
          controller: searchCubit.searchController,
          cursorColor: AppColors.mainColor,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {
                searchCubit.search(searchCubit.searchController.text);
              },
              icon: Icon(Icons.search, color: AppColors.mainColor, size: 35.sp),
            ),
            // prefixIcon: prefixIcon,
            labelText: "search",
            labelStyle: TextStyle(
              color: AppColors.mainColor,
              fontSize: 20.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: AppColors.mainColor,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: AppColors.mainColor,
                width: 2.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: AppColors.mainColor,
                width: 2.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
