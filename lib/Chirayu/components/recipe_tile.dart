// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    super.key,
    required this.calories,
    required this.dishName,
    required this.image,
    required this.ingredients,
  });

  final String image, dishName, ingredients;
  final int calories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromRGBO(229, 247, 227, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Image.asset(image),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$calories Kcal",
                        style: TextStyle(
                          color: Color.fromRGBO(108, 182, 99, 1),
                        ),
                      ),
                      Text(
                        dishName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                      Text(
                        ingredients,
                        style: TextStyle(
                          color: Color.fromRGBO(118, 118, 118, 1),
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
