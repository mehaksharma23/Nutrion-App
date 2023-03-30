// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(229, 229, 229, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          hintText: "Search recipes, articles, people...",
          hintStyle: TextStyle(
            color: Color.fromRGBO(153, 153, 153, 1),
            fontSize: 16,
          ),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Color.fromRGBO(153, 153, 153, 1)),
    );
  }
}
