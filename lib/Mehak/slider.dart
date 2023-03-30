// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class slider extends StatelessWidget {
  slider({
    required this.boxName,
    required this.imagePath,
    required this.boxQuote,
    super.key,
  });

  String boxName;
  String boxQuote;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height) * 0.5,
      width: (MediaQuery.of(context).size.width) * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            boxName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            boxQuote,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
