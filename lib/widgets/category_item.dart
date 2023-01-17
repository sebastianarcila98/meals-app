import 'package:flutter/material.dart';

import '../models/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category categoryItem;
  const CategoryItem(this.categoryItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: categoryItem.color,
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).pushNamed(CategoryMealsScreen.route,
          arguments: {'id': categoryItem.id, 'title': categoryItem.title}),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [categoryItem.color.withOpacity(.6), categoryItem.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            categoryItem.title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
