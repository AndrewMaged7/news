import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/services/provider/provider.dart';
import 'package:news_app/core/widgets/custom_bg.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../home/widgets/drawer_list_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = "settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> locals = ["Arabic", "English"];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: Consumer<MainProvider>(
        builder: (context, provider, child) {
          return CustomBg(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                backgroundColor: Colors.green,
                title: Text(
                  "settings".tr(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                toolbarHeight: 70,
                iconTheme: const IconThemeData(color: Colors.white, size: 30),
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
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      title: "categories".tr(),
                      leading: Icons.view_list_sharp,
                    ),
                    DrawerListWidget(
                      onTap: () {},
                      title: "settings".tr(),
                      leading: Icons.settings,
                    )
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "language".tr(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          )),
                      child: DropdownButton<String>(
                          value: provider.selectedLocal,
                          style: const TextStyle(color :Colors.black,fontSize: 25),
                          isExpanded: true,
                          items: locals
                              .map<DropdownMenuItem<String>>((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) {
                            provider.changeLocal(value!);
                            if (provider.selectedLocal == "Arabic") {
                              context.setLocale(const Locale("ar"));
                            } else {
                              context.setLocale(const Locale("en"));
                            }
                            setState(() {});
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
