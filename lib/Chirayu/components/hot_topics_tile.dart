// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HotTopicsTile extends StatelessWidget {
  const HotTopicsTile({
    super.key,
    required this.imagePath,
    required this.titleText,
    required this.subText,
  });

  final String imagePath, titleText, subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 200,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 200,
            child: Image(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(subText)
              ],
            ),
          )
        ],
      ),
    );
  }
}
