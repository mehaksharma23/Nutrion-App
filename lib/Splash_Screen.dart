// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutrition_app/FireBase/Splash_Services.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  Splashservices splashScreen = Splashservices();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF91C788),
      ),
      child: Center(
        child: Text(
          "Nutri-Track".toUpperCase(),
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
