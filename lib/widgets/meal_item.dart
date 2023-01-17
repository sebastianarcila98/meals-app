import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  const MealItem({super.key, required this.id, required this.title});

  String _getComplexity(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String _getAffordability(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    return ListView.builder(
      itemCount: categoryMeals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              MealDetailsScreen.route,
              arguments: {
                'imageUrl': categoryMeals[index].imageUrl,
                'ingredients': categoryMeals[index].ingredients,
                'steps': categoryMeals[index].steps,
              },
            ),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      categoryMeals[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            const Icon(Icons.access_time),
                            Text(
                              '${categoryMeals[index].duration} mins',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.shopping_bag_rounded),
                            Text(
                              _getComplexity(categoryMeals[index].complexity),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money_sharp),
                            Text(
                              _getAffordability(
                                  categoryMeals[index].affordability),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
