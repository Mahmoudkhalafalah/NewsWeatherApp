import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/views/news_search_view.dart';
import '../services/news_service.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/newsTitleForCarusal.dart';
import '../widgets/news_list_view_builder.dart';

class NewsHomeView extends StatefulWidget {
  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  var articles;

  void show() async {
    articles = await NewsService(Dio()).getTopHeadlines(category: "technology");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    show();
    if (articles == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return search_view();
                        }));
                      },
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: articles.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CarouselSlider.builder(
                          itemCount: articles.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                            child: NewsTitleForCarousel(
                              articleModel: articles[itemIndex],
                            ),
                          ),
                          options: CarouselOptions(
                            aspectRatio: 20 / 9,
                            viewportFraction: 0.7,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.hardEdge,
                          ),
                        )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              NewsListViewBuilder(
                category: 'general',
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
