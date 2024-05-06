import 'package:flutter/material.dart';
import '../models/article_model.dart';

class NewsTitleForCarousel extends StatelessWidget {
  const NewsTitleForCarousel({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            articleModel.image ??
                "https://th.bing.com/th/id/OIP.aV3_1sg9QEdADlu5byNWbwAAAA?w=222&h=180&c=7&r=0&o=5&pid=1.7",
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
                  articleModel.title ?? "",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  articleModel.subTitle ?? "",
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
