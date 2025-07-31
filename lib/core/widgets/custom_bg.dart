import 'package:flutter/material.dart';

class CustomBg extends StatelessWidget {
  final Widget child;
  const CustomBg({required this.child ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"))
        ),
      child: child,

    );
  }
}
