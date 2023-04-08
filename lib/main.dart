import 'package:flutter/material.dart';
import 'package:nutrition_app/Chirayu/favorites.dart';
import 'package:nutrition_app/Chirayu/components/recipes.dart';
import 'Chirayu/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Signika"),
      home: Favorites(),
      routes: {
        "/foods": (context) => Favorites(),
        "/recipes": (context) => FavoriteRecipes()
      },
    );
  }
}
