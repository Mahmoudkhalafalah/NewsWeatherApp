import 'package:flutter/material.dart';
import '../models/article_model.dart';
import 'news_title.dart';

class NewsListView extends StatelessWidget {
 final List<ArticleModel> articles ;

 const NewsListView({super.key ,required this.articles });

  //indicator
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              childCount: articles.length ,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 22,
                  ),
                  child:  NewsTitle(
                    articleModel: articles[index],
                  ),
                );
            },
            ),
          );
        
  }
}