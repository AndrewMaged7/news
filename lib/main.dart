
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/screens/news_details_screen/news_details_screen.dart';
import 'package:news_app/screens/settings_screen/settings_screen.dart';
import 'package:news_app/screens/splash/splash_screen.dart';

void main() {
  runApp(EasyLocalization(
      path: "assets/translations",
      supportedLocales: const [
        Locale("en"),
        Locale("ar")
      ],
      saveLocale: true,
      startLocale: const Locale("en"),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        HomeScreen.routeName : (_) => const HomeScreen(),
        NewsDetailsScreen.routeName : (_) => const NewsDetailsScreen(),
        SettingsScreen.routeName : (_) => const SettingsScreen()
      },
    );
  }
}
