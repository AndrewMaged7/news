
import 'package:flutter/material.dart';

import '../../../models/category_data.dart';

class CategoryWidget extends StatelessWidget {
  CategoryData category;
  bool isRight;
   CategoryWidget({required this.category,required this.isRight ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          bottomRight: isRight ? Radius.zero : const Radius.circular(25),
            bottomLeft:  isRight ? const Radius.circular(25) : Radius.zero,
          topRight: const Radius.circular(25),
          topLeft: const Radius.circular(25),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/${category.image}")),
            const Spacer(),
            Text(category.title,style: const TextStyle(fontSize: 20),),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
