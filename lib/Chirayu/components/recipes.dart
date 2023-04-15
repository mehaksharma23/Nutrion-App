// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Chirayu/components/recipe_tile.dart';

class FavoriteRecipes extends StatefulWidget {
  FavoriteRecipes({super.key});

  @override
  State<FavoriteRecipes> createState() => _FavoriteRecipesState();
}

class _FavoriteRecipesState extends State<FavoriteRecipes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecipeTile(
          image: 'assets/recipe1.png',
          calories: 250,
          dishName: "Chopped Spring Ramen with pav bhaji and paneer",
          ingredients: "Scallions & Tomatoes",
        ),
        RecipeTile(
          image: 'assets/recipe1.png',
          calories: 250,
          dishName: "Chopped Spring Ramen",
          ingredients: "Scallions & Tomatoes",
        ),
        RecipeTile(
          image: 'assets/recipe1.png',
          calories: 250,
          dishName: "Chopped Spring Ramen",
          ingredients: "Scallions & Tomatoes",
        ),
        RecipeTile(
          image: 'assets/recipe1.png',
          calories: 250,
          dishName: "Chopped Spring Ramen",
          ingredients: "Scallions & Tomatoes",
        ),
        RecipeTile(
          image: 'assets/recipe1.png',
          calories: 250,
          dishName: "Chopped Spring Ramen",
          ingredients: "Scallions & Tomatoes",
        ),
      ],
    );
  }
}
