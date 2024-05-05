import 'package:flutter/material.dart';
import '../models/article_model.dart';

class NewsTitleForCarousel extends StatelessWidget {
  const NewsTitleForCarousel({Key? key, required this.articleModel}) ;

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            articleModel.image??"https://www.digitalmesh.com/blog/wp-content/uploads/2020/05/404-error.jpg",
            fit: BoxFit.cover,
            
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),

            ),
          ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articleModel.title??"",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  articleModel.subTitle??"",
                  maxLines: 2,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}