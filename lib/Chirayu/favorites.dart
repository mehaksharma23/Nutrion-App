// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Chirayu/components/foods.dart';
import 'package:nutrition_app/Chirayu/components/recipes.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool isFoodPage = false;

  void changePage() {
    setState(() {
      isFoodPage = !isFoodPage;
    });
  }

  Color secondaryColor = Color.fromRGBO(255, 248, 238, 1);

  Color primaryColor = Color.fromRGBO(255, 147, 133, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        elevation: 0,
        title: Text(
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: isFoodPage ? primaryColor : secondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () => {if (!isFoodPage) changePage()},
                            child: Center(
                              child: Text(
                                "Food",
                                style: TextStyle(
                                  color: isFoodPage
                                      ? secondaryColor
                                      : primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: isFoodPage ? secondaryColor : primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () => {if (isFoodPage) changePage()},
                            child: Center(
                              child: Text(
                                "Recipes",
                                style: TextStyle(
                                  color: isFoodPage
                                      ? primaryColor
                                      : secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isFoodPage ? FavoriteFoods() : FavoriteRecipes(),
            ],
          ),
        ),
      ),
    );
  }
}
