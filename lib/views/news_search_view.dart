import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/services/news_service.dart';
import 'package:news_weather_app_project/widgets/news_title.dart';

class search_view extends StatefulWidget {
  const search_view({super.key});

  @override
  State<search_view> createState() => _search_viewState();
}

class _search_viewState extends State<search_view> {
  TextEditingController controller = TextEditingController();
  @override
  var articles;
  var searchList = [];
  bool isEmptyList = false;
  void show() async {
    articles = [];
    articles = await NewsService(Dio()).getTopHeadlines(category: "general");
  }

  Widget build(BuildContext context) {
    show();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xFF323A69),
            Color(0xff323A6B),
            Color(0xFF374270),
            Color(0xFF3E4977),
            Color(0xFF4F598A),
            Color(0xFF525D93),
            Color(0xFF535D98),
          ])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none
              ),

              style: TextStyle(color: Colors.white),
              onChanged: (v) {
                setState(() {
                  searchList = [];
                });
                for (var i in articles) {
                  if (i.title.toLowerCase().contains(v.toLowerCase())) {
                    setState(() {
                      searchList.add(i);
                    });
                  }
                }
              },
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          body: searchList.length == 0
              ? Center(
                  child: Text(
                    "Enter text you want to search for",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (ctx, idx) {
                    return NewsTitle(articleModel: searchList[idx]);
                  }),
        ),
      ),
    );
  }
}
