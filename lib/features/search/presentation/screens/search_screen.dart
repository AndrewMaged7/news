import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/DI/injectable.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/core/routes/routes.dart';
import 'package:news/features/search/presentation/cubit/search_cubit.dart';
import 'package:news/features/search/presentation/widgets/search_app_bar.dart';

class SearchScreen extends StatelessWidget {
  final SearchCubit cubit = getIt<SearchCubit>();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchAppBarWidget(searchCubit: cubit),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.mainColor));
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else if (state is SearchEmpty) {
                  return const Center(child: Text('No results found.'));
                }
                else if (state is SearchSuccess) {
                  return ListView.builder(
                  itemCount: cubit.searchModel?.articles?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.details, arguments: cubit.searchModel?.articles?[index]);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Image.network(
                              cubit.searchModel?.articles?[index].urlToImage ?? '',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Icon(Icons.newspaper, size: 80.sp),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              cubit.searchModel?.articles?[index].title ?? '',
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
