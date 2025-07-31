import 'package:flutter/material.dart';

class DrawerListWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  void Function() onTap;
  DrawerListWidget({required this.title,required this.leading,required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        splashColor: Colors.transparent,
        leading: Icon(leading,size: 35,color: Colors.black,),
        title: Text(title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w400))
    );
  }
}
