import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/features/home/presentation/cubit/home_cubit.dart';

class SourcesWidget extends StatelessWidget {
  final HomeCubit homeCubit;
  const SourcesWidget({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
              if (state is GetSourcesError) {
                return Center(child: Text(state.message));
              }
        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeCubit.sourcesModel?.sources?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                child: ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    homeCubit.sourcesModel?.sources?[index].name ?? '',
                  ),
                  selected: homeCubit.tabIndex == index,
                  onSelected: (selected) {
                    if (selected) {
                      homeCubit.chooseSource(index);
                    }
                  },
                  selectedColor: AppColors.mainColor,
                  // checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: homeCubit.tabIndex == index
                        ? Colors.white
                        : AppColors.mainColor,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
