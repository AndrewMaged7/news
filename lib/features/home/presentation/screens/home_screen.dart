
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
            // SizedBox(height: 20.h),
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
 


















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news/core/DI/injectable.dart';
// import 'package:news/features/home/presentation/cubit/home_cubit.dart';
// import 'package:news/features/home/presentation/widgets/sources_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late final HomeCubit homeCubit;

//   @override
//   void initState() {
//     super.initState();

//     homeCubit = getIt<HomeCubit>();
//     String category = ModalRoute.of(context)?.settings.arguments as String? ?? 'general';

//     // Fetch sources first, then the first source's news.
//     homeCubit.getSources(category);
//   }

//   @override
//   void dispose() {
//     homeCubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: homeCubit,
//       child: Scaffold(
//         body: Column(
//           children: [
//             const SizedBox(height: 50),

//             SourcesWidget(homeCubit: homeCubit),

//             Expanded(
//               child: BlocBuilder<HomeCubit, HomeState>(
//                 bloc: homeCubit,
//                 builder: (context, state) {
//                   if (state is GetSourcesLoading ||
//                       state is GetNewsLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   if (state is GetSourcesError) {
//                     return Center(
//                       child: Text(state.message),
//                     );
//                   }

//                   if (state is GetNewsError) {
//                     return Center(
//                       child: Text(state.message),
//                     );
//                   }

//                   final articles =
//                       homeCubit.newsModel?.articles ?? [];

//                   if (state is GetNewsSuccess) {
//                     if (articles.isEmpty) {
//                       return const Center(
//                         child: Text('No news available'),
//                       );
//                     }

//                     return ListView.builder(
//                       itemCount: articles.length,
//                       itemBuilder: (context, index) {
//                         final article = articles[index];

//                         return ListTile(
//                           leading: article.urlToImage != null
//                               ? Image.network(
//                                   article.urlToImage!,
//                                   width: 80,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (_, __, ___) =>
//                                       const Icon(Icons.newspaper),
//                                 )
//                               : const Icon(Icons.newspaper),
//                           title: Text(article.title ?? ''),
//                           subtitle: Text(
//                             article.source?.name ?? '',
//                           ),
//                         );
//                       },
//                     );
//                   }

//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news/core/DI/injectable.dart';
// import 'package:news/features/home/presentation/cubit/home_cubit.dart';
// import 'package:news/features/home/presentation/widgets/sources_widget.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final HomeCubit homeCubit = getIt<HomeCubit>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: homeCubit,
//       child: Scaffold(
//         body: Column(
//           children: [
//             SizedBox(height: 50),
//             SourcesWidget(homeCubit: homeCubit),
//             Expanded(
//               child: BlocBuilder<HomeCubit, HomeState>(
//                 bloc: homeCubit..getNews(sourceId: homeCubit.sourcesModel?.sources?.first.id ?? ''),
//                 builder: (context, state) {
//                   if (state is GetNewsLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (state is GetNewsError) {
//                     return Center(
//                       child: Text(state.message),
//                     );
//                   }
//                   if (state is GetNewsSuccess) {
//                     final articles =
//                         homeCubit.newsModel?.articles ?? [];
//                     if (articles.isEmpty) {
//                       return const Center(
//                         child: Text('No news available'),
//                       );
//                     }

//                     return ListView.builder(
//                       itemCount: articles.length,
//                       itemBuilder: (context, index) {
//                         final article = articles[index];

//                         return ListTile(
//                           leading: article.urlToImage != null
//                               ? Image.network(
//                                   article.urlToImage!,
//                                   width: 80,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (_, __, ___) =>
//                                       const Icon(Icons.newspaper),
//                                 )
//                               : const Icon(Icons.newspaper),
//                           title: Text(article.title ?? ''),
//                           subtitle: Text(
//                             article.source?.name ?? '',
//                           ),
//                         );
//                       },
//                     );
//                   }

//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:news/core/DI/injectable.dart';
// import 'package:news/features/home/presentation/cubit/home_cubit.dart';
// import 'package:news/features/home/presentation/widgets/sources_widget.dart';

// class HomeScreen extends StatelessWidget {
//   final HomeCubit homeCubit = getIt<HomeCubit>();
//   HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SourcesWidget(homeCubit: homeCubit),
//         ],
//       ),
//     );
//   }
// }