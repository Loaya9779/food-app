import 'package:flutter/material.dart';
import 'package:food_app/features/home/model/meals.dart';
import 'package:food_app/features/home/widgets/item_container.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemCount: 5,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        final item = Meal.fromJson;
        return ItemContainer(
          items: Meal(image: '', title: '', kcal: '', time: '', mealType: ''),
        );
      },
    );
  }
}
