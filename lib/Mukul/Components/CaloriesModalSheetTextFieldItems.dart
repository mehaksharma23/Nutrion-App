// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CaloriesModalSheetTextField extends StatelessWidget {
  const CaloriesModalSheetTextField({
    super.key,
    required this.controller,
    required this.textHint,
    required this.inputType,
    required this.width,
  });

  final TextEditingController controller;
  final String textHint;
  final TextInputType inputType;
  final width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          filled: true,
          hintText: textHint,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
          ),
          fillColor: Color.fromRGBO(242, 175, 217, 0.45),
          focusColor: Color.fromRGBO(242, 175, 217, 0.45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return textHint;
          }
          return null;
        },
      ),
    );
  }
}
