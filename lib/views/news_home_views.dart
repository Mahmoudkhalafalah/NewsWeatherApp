import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/views/news_search_view.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/newsTitleForCarusal.dart';
import '../widgets/news_list_view_builder.dart';

class NewsHomeView extends StatefulWidget {
  const NewsHomeView({super.key});

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  var articles;

  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).getGeneralNews();
    articles = Provider.of<AppProvider>(context).generalArticles;
    if (articles == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          return const search_view();
                        }));
                      },
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: articles.isEmpty
                      ? const Center(
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
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.hardEdge,
                          ),
                        )),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const NewsListViewBuilder(
                category: 'technology',
              ),
              const SliverToBoxAdapter(
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
