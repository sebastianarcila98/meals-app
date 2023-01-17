import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black, fontSize: 20),
            bodyText2: TextStyle(
              color: Colors.white,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(color: Colors.black, fontSize: 15)),
      ),
      routes: {
        '/': (context) => const CategoryScreen(),
        CategoryMealsScreen.route: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.route: (context) => const MealDetailsScreen(),
      },
    );
  }
}
