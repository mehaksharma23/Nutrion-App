// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

class termsAndCondition extends StatefulWidget {
  const termsAndCondition({Key? key}) : super(key: key);

  @override
  State<termsAndCondition> createState() => _termsAndConditionState();
}

class _termsAndConditionState extends State<termsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text (
          "T&C- We don't care",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ) ,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Image(
            image: AssetImage('assets/termsAndCondition.jpeg'),
          ),
        ),
      ),
    );
  }
}
