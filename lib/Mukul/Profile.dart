// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/FireBase/Auth/ExceptionHandler.dart';
import 'package:nutrition_app/Mehak/Mehak.dart';
import 'package:nutrition_app/Mukul/Components/ProfileMenuSettings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.body}) : super(key: key);
  final body;
  @override
  State<Profile> createState() => _ProfileState(body: body);
}

class _ProfileState extends State<Profile> {
  _ProfileState({required this.body}):super();
  final body;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding:  EdgeInsets.fromLTRB(0,40,0,0),
          child: Container(
            height: (MediaQuery.of(context).size.height) * 0.9,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage("${body['ProfilePic']}"),
                  radius: 80,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "${body['Name']}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Anonymous",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.4,
                  width: (MediaQuery.of(context).size.width) * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileMenuCard(
                        icon: Icons.person,
                        textBox: "Edit Profile",
                        onTap: () {},
                      ),
                      ProfileMenuCard(
                        icon: Icons.star,
                        textBox: "Renew Plan",
                        onTap: () {},
                      ),
                      ProfileMenuCard(
                        icon: Icons.settings,
                        textBox: "Settings",
                        onTap: () {},
                      ),
                      ProfileMenuCard(
                        icon: Icons.insert_page_break,
                        textBox: "Terms & Privacy Policy",
                        onTap: () {},
                      ),
                      ProfileMenuCard(
                        icon: Icons.logout,
                        textBox: "Log Out",
                        onTap: () {
                          auth.signOut().then((value) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => GetStarted()),
                            );
                          }).onError((error, stackTrace) {
                            ExceptionHandle().toastMessage(error.toString());
                          });
                        },
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
