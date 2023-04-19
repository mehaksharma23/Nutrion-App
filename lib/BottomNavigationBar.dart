// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutrition_app/Chirayu/camera.dart';
import 'package:nutrition_app/Chirayu/favorites.dart';
import 'package:nutrition_app/Chirayu/search_page.dart';
import 'package:nutrition_app/Mukul/Home.dart';
import 'package:nutrition_app/Mukul/Profile.dart';

class navBar extends StatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  final userUID = FirebaseAuth.instance.currentUser!.uid;
  final users = FirebaseFirestore.instance.collection('users');

  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
          stream: users.doc(userUID.toString()).snapshots(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                  ),
                  child: Text(
                      'Can\'t connect to Database, Try again later........'),
                ),
              );
            } else {
              var doc = snapshot.data as DocumentSnapshot;
              List pages = [
                Home(
                  body: doc,
                ),
                SearchPage(),
                TakePictureScreen(),
                Favorites(),
                Profile(
                  body: doc,
                ),
              ];
              return pages[currentState];
            }
          },
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          child: GNav(
            selectedIndex: currentState,
            onTabChange: (index) {
              setState(() {
                currentState = index;
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
    );
  }
}
