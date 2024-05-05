import 'package:dio/dio.dart';
import '../models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    //String apiKey = '87fb912cdc604190810d02db01eb8cf8';
    //String apiKey = 'b8731439d34140c6bffc03c115ad374c';
    String apiKey = 'ffce7d3fdcde415eb068b32418f51d6d';
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);

        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
