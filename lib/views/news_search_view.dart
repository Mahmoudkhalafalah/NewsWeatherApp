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
  void show()async{
    articles = [];
    articles=await NewsService(Dio()).getTopHeadlines(
        category: "general"
    );
  }
  Widget build(BuildContext context) {
    show();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
          onChanged: (v){
            setState(() {
              searchList = [];
            });
            for(var i in articles){
              if(i.title.toLowerCase().contains(v.toLowerCase())){
                setState(() {
                  searchList.add(i);
                });
              }
            }
          },
        ),
      ),
      body: searchList.length == 0? Center(child: Text("enter text you want to search for"),): ListView.builder(
          itemCount: searchList.length,
          itemBuilder: (ctx,idx){
        return NewsTitle(articleModel: searchList[idx]);
      }),
    );
  }
}
