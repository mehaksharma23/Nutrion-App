// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Mehak/slider.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutrition_app/Mehak/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Color inactiveColor = Color(0xF91C788);
  Color activeColor = Colors.white;
  int height = 180;
  int weight = 30;
  int Age = 15;
  bool male = true;
  bool female = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI"),
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Container(
                child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      male = true;
                      female = false;
                    });
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width) * 0.5,
                    height: (MediaQuery.of(context).size.height) * 0.3,
                    decoration: BoxDecoration(
                      color: male ? Colors.green : Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.male,
                            color: Colors.yellowAccent, size: 45.0),
                        Text(
                          "male",
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      female = true;
                      male = false;
                    });
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width) * 0.5,
                    height: (MediaQuery.of(context).size.height) * 0.3,
                    decoration: BoxDecoration(
                      color: female ? Colors.green : Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.female,
                            color: Colors.yellowAccent, size: 45.0),
                        Text("Female")
                      ],
                    ),
                  ),
                )
              ],
            ))
          ]),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("HEIGHT",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "${height}",
                    ),
                    Text("cm",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black)),
                  ]),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  overlayColor: Color(0x291DE986),
                  inactiveTrackColor: Colors.grey,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  thumbColor: Color(0xFF1DE9B6),
                ),
                child: Slider(
                  onChanged: (double v) {
                    setState(() {
                      height = v.round();
                    });
                  },
                  value: height.toDouble(),
                  min: 100.0,
                  max: 250.0,
                ),
              ),
            ],
          )),
          Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${weight}",
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "kg",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: (){
                              setState(() {
                                if(weight>10){
                                  weight--;
                                }

                              });
                            },
                          )
                        )
                      ]
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${Age}",
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "yrs",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: (){
                              setState(() {
                                Age++;
                              });
                            },
                          )
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: (){
                              setState(() {
                                if(Age>10){
                                  Age--;
                                }

                              });
                            },
                          )
                      )
                  ],
                )
                  ]
              ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            color: Color(0xFF1DE986),
            child: Center(
              child: Text(
                "Calculate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
              )
            )

          ),
          InkWell(
          onTap: (){

    },
    )
    ,


        ],
      ),
    );
}
    void navigateToResultsScreen(double result) {

    }
}


