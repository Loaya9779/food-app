import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Icon(Icons.wb_sunny, color: Colors.yellow, size: 30),
          Text(
            "Good Morning",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.shopping_cart, color: Colors.grey, size: 30),
        ],
      ),
    );
  }
}
