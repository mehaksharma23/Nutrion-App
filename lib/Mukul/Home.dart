// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              InkWell(
                onTap: () {},
                child: Container(
                  width: (MediaQuery.of(context).size.width) * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2F0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width) * 0.8 * 0.5,
                        child: Column(
                          children: [
                            Text(
                              "ARTICLE",
                              style: TextStyle(
                                color: Color(0xFFFF806E),
                                letterSpacing: 1.5,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "The pros and cons of fast food.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFF8473),
                              ),
                              child: Text("READ NOW"),
                            ),
                          ],
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/FastFood.png'),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xFF9E9BC7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Track Your Weekly Progress",
                    ),
                    Container(
                      child: Text("View more"),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Text(
                      "Choose your Favorites",
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
