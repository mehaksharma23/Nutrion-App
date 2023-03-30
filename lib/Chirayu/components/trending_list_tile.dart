// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TrendingListTile extends StatelessWidget {
  const TrendingListTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Color.fromRGBO(255, 132, 115, 1)),
          ),
          SizedBox(
            height: 20,
            child: Padding(
              padding: EdgeInsets.fromLTRB(4, 4, 0, 4),
              child: Image.asset(
                'assets/link.png',
                color: Color.fromRGBO(255, 132, 115, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
