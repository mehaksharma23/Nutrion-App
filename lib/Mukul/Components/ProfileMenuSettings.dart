// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  ProfileMenuCard({
    required this.icon,
    required this.textBox,
    required this.onTap,
    super.key,
  });
  IconData icon;
  String textBox;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: (MediaQuery.of(context).size.height) * 0.5 * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height) *0.5 *0.15,
              child: Row(
                children: [
                  Container(
                      height: (MediaQuery.of(context).size.height) *0.5 *0.15,
                      width: (MediaQuery.of(context).size.width) *0.15,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF8EE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        size: 40,
                        color: Color(0xFFFF9385),
                      )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    textBox,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF909090),
            ),
          ],
        ),
      ),
    );
  }
}
