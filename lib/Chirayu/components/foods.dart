// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Chirayu/components/add_new_food_tile.dart';
import 'package:nutrition_app/Chirayu/components/food_tile.dart';

class FavoriteFoods extends StatelessWidget {
  FavoriteFoods({
    super.key,
  });

  Color secondaryColor = Color.fromRGBO(255, 248, 238, 1);

  Color primaryColor = Color.fromRGBO(255, 147, 133, 1);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: [
        FoodTile(imagePath: "assets/cupcake.png"),
        FoodTile(imagePath: "assets/burger.png"),
        FoodTile(imagePath: "assets/FastFood.png"),
        FoodTile(imagePath: "assets/Snacks.png"),
        AddNewFoodTitle()
      ],
    );
  }
}
