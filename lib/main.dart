import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/DI/injectable.dart';
import 'package:news/core/cache/cache.dart';
import 'package:news/core/internet/presentation/cubit/internet_cubit.dart';
import 'package:news/core/observer/observer.dart';
import 'package:news/core/routes/routes.dart';
import 'package:news/core/routes/routes_gen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await HiveCacheHelper.init('appCache');
    debugPrint(
    'Hive keys after restart: ${HiveCacheHelper.getAllKeys()}',
  );
  debugPrint(
    'Hive values after restart: ${HiveCacheHelper.getAllValues()}',
  );
  Bloc.observer = MyBlocObserver();
  configureDependencies(); 
  getIt<InternetCubit>().startMonitoring();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      builder: (_ , child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.generateRoute,
        initialRoute: Routes.categories,
      );
      }
    );
  }
}
