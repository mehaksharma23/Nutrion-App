// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutrition_app/Chirayu/search_page.dart';
import 'package:nutrition_app/Mukul/Home.dart';
import 'package:nutrition_app/Mukul/Profile.dart';

// void main() =>
//     (runApp(MaterialApp(
//       home: navBar(),
//       debugShowCheckedModeBanner: false,
//     )));

class navBar extends StatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {

  List pages = [
    Home(),
    SearchPage(),
    SearchPage(),
    SearchPage(),
    Profile(),
  ];
  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: pages[currentState],
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            child: GNav(
              selectedIndex: currentState,
              onTabChange:(index){
                setState(() {
                  currentState=index;
                });
              },
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              activeColor: Colors.green,
              iconSize: 30,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  // text: "Home",
                ),
                GButton(
                  icon: Icons.search_outlined,
                  // text: "Search",
                ),
                GButton(
                  icon: Icons.camera_alt_outlined,
                  // text: "Scan",
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  // text: "Favourite",
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                  // text: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
