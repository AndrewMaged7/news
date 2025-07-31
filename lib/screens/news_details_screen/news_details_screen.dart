import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_bg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return CustomBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          backgroundColor: Colors.green,
          title: Text(
            articles.title??"",
            style: const TextStyle(
              color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          toolbarHeight: 70,
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
        ),
        body: Card(
          elevation: 10,
          color: Colors.white,
          margin: const EdgeInsets.only(
              top: 20, right: 15, left: 15, bottom: 100),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(articles.urlToImage ?? ""),
                ),
                const SizedBox(height: 5),
                Text(articles.source?.name ?? "",
                  style: const TextStyle(fontSize: 12),),
                const SizedBox(height: 5),
                Text(articles.description ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(articles
                        .publishedAt
                        ?.substring(0, 10) ??
                        "", style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(articles.content ?? "",
                    style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 10),
                Text(articles.url ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    _launchUrl(articles.url ?? "");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("View Full Article"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}