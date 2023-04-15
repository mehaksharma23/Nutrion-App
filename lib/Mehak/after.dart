// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: after(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class after extends StatefulWidget {
  @override
  State<after> createState() => _afterState();
}

class _afterState extends State<after> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/burger.png"),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * 1,
                height: (MediaQuery.of(context).size.height) * 0.2,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFEE8F08),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Protein",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "450g",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text("220g",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Fat",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "100g",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Carbs",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "49g",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height)*0.15*0.80,
                      child: SingleChildScrollView(
                        child: Text(
                          "A hamburger(also burger for short) is a sandwich consiting of one or more cooked patties of ground mear,usually beef,placed inside a sliced bread.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Ingredients",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.09,
                      width: (MediaQuery.of(context).size.width) * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xFEE8F08),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage("assets/Ingredients1.png"),
                      ),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.09,
                      width: (MediaQuery.of(context).size.width) * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xFEE8F08),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage("assets/Ingredients2.png"),
                      ),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.09,
                      width: (MediaQuery.of(context).size.width) * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xFEE8F08),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage("assets/Ingredients3.png"),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: (MediaQuery.of(context).size.height) * 0.09,
                          width: (MediaQuery.of(context).size.width) * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFEE8F08),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "View All",
                              style: TextStyle(
                                // fontSize: 18,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  child: Container(
                    height: (MediaQuery.of(context).size.height) * 0.09,
                    width: (MediaQuery.of(context).size.width) * 0.6,
                    child: Center(
                      child: Text(
                        "Add to Favourites",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
