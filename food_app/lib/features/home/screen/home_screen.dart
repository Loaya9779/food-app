import 'package:flutter/material.dart';
import 'package:food_app/features/home/widgets/custom_category.dart';
import 'package:food_app/features/home/widgets/home_header.dart';
import 'package:food_app/features/home/widgets/item_list.dart';
import 'package:food_app/features/home/widgets/title_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HomeHeader(),
            TitleList(),
            SizedBox(height: 10),
            CustomCategory(),
            Expanded(child: ItemList()),
          ],
        ),
      ),
    );
  }
}
