// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nutrition_app/Mukul/Components/FoodType.dart';

// void main() => runApp(MaterialApp(
//       home: Home(),
//       debugShowCheckedModeBanner: false,
//     ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Hello NAME",
                        style: TextStyle(
                          color: Color(0xFF91C788),
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "Find, Track and eat healthy food",
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2F0),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width) * 0.9 * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "ARTICLE",
                                style: TextStyle(
                                  color: Color(0xFFFF806E),
                                  letterSpacing: 1.5,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "The pros and cons of fast food.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: (MediaQuery.of(context).size.width) *
                                      0.9 *
                                      0.5 *
                                      0.7,
                                  height: (MediaQuery.of(context).size.height) *
                                      0.05,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF8473),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Read Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/FastFood.png'),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  height: (MediaQuery.of(context).size.height) * 0.14,
                  decoration: BoxDecoration(
                    color: Color(0xFF9E9BC7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: (MediaQuery.of(context).size.height) * 0.10,
                          width:
                              (MediaQuery.of(context).size.width) * 0.9 * 0.5,
                          child: Center(
                            child: Text(
                              "Track Your Weekly Progress",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width) * 0.9 * 0.3,
                            height: (MediaQuery.of(context).size.height) * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View Now",
                                  style: TextStyle(
                                    color: Color(0xFF9E9BC7),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Color(0xFF9E9BC7),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.3,
                  width: (MediaQuery.of(context).size.width) * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose your Favorites",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height:
                            (MediaQuery.of(context).size.height) * 0.3 * 0.6,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FoodType(
                              bgcolor: 0xFFFFF2F0,
                              boxName: "Fruits",
                              imagePath: "assets/Fruits.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FoodType(
                              bgcolor: 0xFFEFF7EE,
                              boxName: "Vegetable",
                              imagePath: "assets/Vegetables.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FoodType(
                              bgcolor: 0xFFFFF8EB,
                              boxName: "Snacks",
                              imagePath: "assets/Snacks.png",
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
