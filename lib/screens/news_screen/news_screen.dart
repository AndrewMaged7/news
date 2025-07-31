import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/services/apis/api_manger.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/screens/news_details_screen/news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  final String categoryId;
  const NewsScreen({required this.categoryId,super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getSources(widget.categoryId),
      builder: (context, snapshot) {
        List<Sources> sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
                length: sources.length,
                child: TabBar(
                    onTap: (value) {
                      isSelected = value;
                      setState(() {});
                    },
                    isScrollable: true,
                    labelPadding: const EdgeInsets.all(4),
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: sources.map(
                          (e) {
                        return Tab(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: isSelected == sources.indexOf(e)
                                    ? Colors.green
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.green)),
                            child: Text(
                              e.name ?? "",
                              style: TextStyle(
                                  color: isSelected == sources.indexOf(e)
                                      ? Colors.white
                                      : Colors.green),
                            ),
                          ),
                        );
                      },
                    ).toList())),
            if (sources.isNotEmpty)
              FutureBuilder(
                future: ApiManger.getNews(id: sources[isSelected].id ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("error"),
                    );
                  } else {
                    List<Articles> articles = snapshot.data?.articles ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: articles[index]);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(articles[index].urlToImage ?? ""),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(articles[index].source?.name ?? ""),
                                    const SizedBox(height: 5),
                                    Text(articles[index].description ?? ""),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(articles[index]
                                            .publishedAt
                                            ?.substring(0, 10) ??
                                            ""),
                                      ],
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
                },
              ),
          ],
        );
      },
    );
  }
}
