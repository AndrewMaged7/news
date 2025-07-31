
import 'package:flutter/material.dart';
import 'package:news_app/screens/home/widgets/category_widget.dart';

import '../../models/category_data.dart';

class CategoryScreen extends StatelessWidget {

  void Function(CategoryData) onTap;
  CategoryScreen({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 10,),
              Text(
                "Pick your category \n of interest",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryData.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 140/160),
              itemBuilder: (BuildContext context, int index) {
                return
                  InkWell(
                    onTap: () {
                      onTap(CategoryData.categories[index]);
                    },
                    child: CategoryWidget(
                        category: CategoryData.categories[index],
                        isRight: index % 2 == 0),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
