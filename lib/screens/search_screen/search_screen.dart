import 'package:flutter/material.dart';

import '../../core/services/apis/api_manger.dart';
import '../../models/news_model.dart';
import '../news_details_screen/news_details_screen.dart';

class SearchScreen extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        iconTheme: IconThemeData(color: Colors.white),
        // affects AppBar's background color
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query ="";
        showSuggestions(context);
      }, icon:const  Icon(Icons.clear,size: 30,)),
      IconButton(onPressed: (){
        showResults(context);
      }, icon:const  Icon(Icons.search,size: 30,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getNews(quary: query),
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
          return ListView.builder(
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
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) {
      return const Center(child: Text("please, Enter Text to search",style: TextStyle(fontSize: 20),));
    }
      return FutureBuilder(
        future: ApiManger.getNews(quary: query),
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
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NewsDetailsScreen.routeName,
                        arguments: articles[index]);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                articles[index].urlToImage ?? ""),
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
            );
          }
        },
      );
  }

}