import 'package:flutter/material.dart';
import '../models/Category_models.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/Business.PNG', categoryName: 'Business'),
    CategoryModel(
        image: 'assets/entertainment.PNG', categoryName: 'Entertainment'),
    CategoryModel(image: 'assets/Health.PNG', categoryName: 'Health'),
    CategoryModel(image: 'assets/General.PNG', categoryName: 'General'),
    CategoryModel(image: 'assets/Science.PNG', categoryName: 'Science'),
    CategoryModel(image: 'assets/sport.PNG', categoryName: 'Sports'),
    CategoryModel(image: 'assets/technology.PNG', categoryName: 'Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
