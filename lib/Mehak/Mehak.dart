// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables,

import 'package:flutter/material.dart';
import 'package:nutrition_app/FireBase/Auth/register.dart';
import 'package:nutrition_app/FireBase/Auth/sign_in.dart';
import 'package:nutrition_app/Mehak/slider.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  "Nutri Track",
                  style: TextStyle(color: Color(0xFF95B63A), fontSize: 36),
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * 0.6,
                width: (MediaQuery.of(context).size.width) * 0.8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    slider(
                      boxName: " Eat Healthy",
                      imagePath: "assets/eathealthy.png",
                      boxQuote:
                          "Maintaining good health should be the primary focus of everyone",
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    slider(
                      boxName: " Healthy Recipes",
                      imagePath: "assets/recipe.png",
                      boxQuote:
                          "Browse thousands of recipes \n from all over the world.",
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    slider(
                      boxName: "Track Your Health",
                      imagePath: "assets/track.png",
                      boxQuote:
                          "With amazing inbuilt tools you can \n track your progress.",
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(color: Colors.green)),
                    ),
                  ),
                  child: Container(
                    height: (MediaQuery.of(context).size.height) * 0.07,
                    width: (MediaQuery.of(context).size.width) * 0.5,
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      enableFeedback: false,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                        ),
                      ),
                    ),
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
