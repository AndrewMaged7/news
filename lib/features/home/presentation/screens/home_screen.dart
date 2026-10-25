
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/DI/injectable.dart';
import 'package:news/core/colors/app_colors.dart';
import 'package:news/core/widgets/drawer_widget.dart';
import 'package:news/features/home/presentation/cubit/home_cubit.dart';
import 'package:news/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:news/features/home/presentation/widgets/news_item_widget.dart';
import 'package:news/features/home/presentation/widgets/sources_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit homeCubit;
  bool _initialized = false;
  @override
  void initState() {
    super.initState();
    homeCubit = getIt<HomeCubit>();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    final category =
        ModalRoute.of(context)?.settings.arguments as String?
            ?? 'general';
    homeCubit.category = category;
    homeCubit.getSources(category);
  }
  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: Scaffold(
        drawer: DrawerWidget(),
        body: Column(
          children: [
            HomeAppBarWidget(scaffoldKey: homeCubit.scaffoldKey, title: homeCubit.category),
            SizedBox(height: 10.h),
        
            SourcesWidget(homeCubit: homeCubit),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: homeCubit,
                builder: (context, state) {
                  if (state is GetSourcesLoading ||
                      state is GetNewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.mainColor),
                    );
                  }
        
                  if (state is GetSourcesError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
        
                  if (state is GetNewsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return NewsItemWidget(homeCubit: homeCubit);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}