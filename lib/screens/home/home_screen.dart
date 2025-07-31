
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screens/home/widgets/category_widget.dart';
import 'package:news_app/screens/home/widgets/drawer_list_widget.dart';
import 'package:news_app/screens/news_screen/news_screen.dart';
import 'package:news_app/screens/settings_screen/settings_screen.dart';

import '../../core/widgets/custom_bg.dart';
import '../../models/category_data.dart';
import '../search_screen/search_screen.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBg(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: categoryData == null ?AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: Colors.green,
        title: const Text(
          "News App",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ) : AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: Colors.green,
        title: Text(
          categoryData!.title,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        actions: [
          IconButton(onPressed: (){showSearch(context: context, delegate: SearchScreen());}
              , icon:const Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                child: Text(
                  "News App!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DrawerListWidget(
              onTap: () {
                categoryData = null;
                setState(() {
                });
                Navigator.pop(context);
              },
              title: "categories".tr(),
              leading: Icons.view_list_sharp,
            ),
            DrawerListWidget(
              onTap: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
              title: "settings".tr(),
              leading: Icons.settings,
            )
          ],
        ),
      ),
      body: categoryData == null ? CategoryScreen(onTap: onTapCategory) :
      NewsScreen(categoryId: categoryData!.id),
    ));
  }

  CategoryData? categoryData;

  onTapCategory(CategoryData category){
    categoryData = category;
    setState(() {});
  }
}

