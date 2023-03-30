// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Mukul/ProfileMenuSettings.dart';

void main() => runApp(MaterialApp(
      home: Profile(),
      debugShowCheckedModeBanner: false,
    ));

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: (MediaQuery.of(context).size.height)*0.8,
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
                backgroundImage: AssetImage("assets/anonymous.jpg"),
                radius: 80,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Anonymous",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
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
                    ProfileMenuCard(icon: Icons.person, textBox: "Edit Profile"),
                    ProfileMenuCard(icon: Icons.star, textBox: "Renew Plan"),
                    ProfileMenuCard(icon: Icons.settings, textBox: "Settings"),
                    ProfileMenuCard(icon: Icons.insert_page_break, textBox: "Terms & Privacy Policy"),
                    ProfileMenuCard(icon: Icons.logout, textBox: "Log Out"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
