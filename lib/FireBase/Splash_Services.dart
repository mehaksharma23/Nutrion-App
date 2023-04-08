// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/BottomNavigationBar.dart';
import 'package:nutrition_app/FireBase/Auth/sign_in.dart';
import 'package:nutrition_app/Mukul/profileDetails.dart';

class Splashservices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => navBar()),
          // MaterialPageRoute(builder: (context) => profileDetails()),
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignIn()),
        ),
      );
    }
  }
}
