// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = '/meal-details';
  const MealDetailsScreen({super.key});

  // Widget _buildIngredientList(List<String> ingredients) {}

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final image = routeArgs['imageUrl'] as String;
    final ingredients = routeArgs['ingredients'] as List<String>;
    final steps = routeArgs['steps'] as List<String>;

    return Scaffold(
        appBar: AppBar(title: const Text('hi')),
        body: Column(
          children: [
            Image.network(image),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ...ingredients.map(
              (ingredient) => Container(
                width: 300,
                child: Card(
                  child: Text(
                    ingredient,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: ListView.separated(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(steps[index]),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            )
          ],
        ));
  }
}
