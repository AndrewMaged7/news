
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_bg.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3) , () {
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false,);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomBg(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: ZoomIn(
              duration: const Duration(seconds: 3),
              child: const Image(image: AssetImage("assets/images/logo.png"))),),
        ));
  }
}
