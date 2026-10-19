import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/DI/injectable.dart';
import 'package:news/core/routes/routes.dart';
import 'package:news/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:news/features/categories/presentation/widgets/app_bar_widget.dart';
import 'package:news/features/categories/presentation/widgets/category_widget.dart';
import 'package:news/core/widgets/drawer_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final CategoriesCubit cubit = getIt<CategoriesCubit>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: cubit.scaffoldKey,

      drawer: DrawerWidget(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarWidget(scaffoldKey: cubit.scaffoldKey),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              Text('Pick your category of interest', style: TextStyle(fontSize: 24.sp)),
            ],
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // cubit.chooseCategory(index);
                    Navigator.pushNamed(context, Routes.home, arguments: cubit.categoriesNames[index].toLowerCase());
                  },
                  child: CategoryWidget(
                    categoryName: cubit.categoriesNames[index],
                    backgroundColor: cubit.categoryColors[index],
                    imageUrl: cubit.categoryImages[index],
                    index: index,
                  ),
                );
              },
              ),
          ),
        ],
      ),
    );
  }
}