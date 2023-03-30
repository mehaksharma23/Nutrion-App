import 'package:flutter/material.dart';
import 'package:nutrition_app/Mehak/slider.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  child: Text(
                    "Nutri Track",
                    style: TextStyle(color: Color(0xFF95B63A), fontSize: 36),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) *  0.3*0.6,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                         slider(

                           boxName:" Eat Healthy",
                           imagePath:
                         )
                    ]
                  )
                ),
                Container(
                  child: Text(
                    "Eat Healthy",
                    style: TextStyle( fontSize: 25),
                  ),
                ),
                Container(
                  child: Text(
                    "Maintaining good health should be the\n primary focus of everyone"  ,

                    style: TextStyle(
                        color:Colors.grey,
                        fontSize: 17),
                  )

                ) ,








                Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.09,
                      width: (MediaQuery.of(context).size.width) * 0.6,
                      child: Center(
                        child: Text(
                          "Get Started" ,
                     style:
                           TextStyle
                             (
                             fontSize: 25 ,

                           )),
                      ),
                    ) ,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.green)
                        )
                      )

                    )

                  )

                ) ,
                Container(
                  child: Text(
                    "Already have an account?Login",
                    style:TextStyle(
                      color:Colors.grey,
                      fontSize:17
                    ),
                  )
                )



              ]),
        ),
      ),
    );
  }
}                   
