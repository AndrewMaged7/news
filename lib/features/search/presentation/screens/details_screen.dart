import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/DI/injectable.dart';
import 'package:news/features/search/data/models/search_model.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/features/search/presentation/cubit/search_cubit.dart';
import 'package:news/features/search/presentation/widgets/details_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final SearchCubit cubit = getIt<SearchCubit>();

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? argument = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Column(
        children: [
          DetailsAppBar(),
          SizedBox(height: 20),
          Image.network(
            (argument is Articles) ? argument.urlToImage ?? "" : (argument is SearchArticles) ? argument.urlToImage ?? "" : "",
            width: double.infinity,
            height: 232.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image_not_supported, size: 100.sp, color: Colors.grey);
            },
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (argument is Articles) ? argument.source?.name ?? "" : (argument is SearchArticles) ? argument.source?.name ?? "" : "",
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 15.h),
                Text(
                  (argument is Articles) ? argument.title ?? "" : (argument is SearchArticles) ? argument.title ?? "" : "",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text((argument is Articles) ? argument.publishedAt!.substring(0, 10) : (argument is SearchArticles) ? argument.publishedAt!.substring(0, 10) : "", style: TextStyle(fontSize: 16.sp)),
                    SizedBox(width: 10.w),
                    Text((argument is Articles) ? argument.publishedAt!.substring(11, 16) : (argument is SearchArticles) ? argument.publishedAt!.substring(11, 16) : "", style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
                SizedBox(height: 25.h),
                Text((argument is Articles) ? argument.content ?? "" : (argument is SearchArticles) ? argument.content ?? "" : "", style: TextStyle(fontSize: 16.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
