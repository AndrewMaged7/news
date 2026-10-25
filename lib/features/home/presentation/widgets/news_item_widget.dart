import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/core/routes/routes.dart';
import 'package:news/features/home/presentation/cubit/home_cubit.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
        itemCount: homeCubit.newsModel?.articles?.length ?? 0,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.details,
                      arguments: homeCubit.newsModel?.articles?[index],
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl:
                        homeCubit.newsModel?.articles?[index].urlToImage ?? '',
                    height: 232.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: 232.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Center(child: Icon(Icons.broken_image, size: 232.sp)),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(homeCubit.newsModel?.articles?[index].title ?? ''),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    homeCubit.newsModel?.articles?[index].source?.name ?? '',
                  ),
                  Spacer(),
                  Text(
                    homeCubit.newsModel?.articles?[index].publishedAt!
                            .substring(0, 10) ??
                        '',
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 15.h),
            ],
          );
          // return ListTile(
          //   leading: Image.network(
          //     homeCubit.newsModel?.articles?[index].urlToImage ?? '',
          //     width: 80,
          //     fit: BoxFit.cover,
          //     errorBuilder: (_, __, ___) => const Icon(Icons.newspaper),
          //   ),
          //   title: Text(homeCubit.newsModel?.articles?[index].title ?? ''),
          //   subtitle: Text(
          //     homeCubit.newsModel?.articles?[index].source?.name ?? '',
          //   ),
          // );
        },
      ),
    );
  }
}
