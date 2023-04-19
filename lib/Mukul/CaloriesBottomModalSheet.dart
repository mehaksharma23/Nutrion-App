// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/BottomNavigationBar.dart';
import 'package:nutrition_app/FireBase/Auth/ExceptionHandler.dart';
import 'package:nutrition_app/Mukul/Components/CaloriesModalSheetTextFieldItems.dart';

class CaloriesBottomModalSheet extends StatefulWidget {
  const CaloriesBottomModalSheet({Key? key}) : super(key: key);

  @override
  State<CaloriesBottomModalSheet> createState() =>
      _CaloriesBottomModalSheetState();
}

class _CaloriesBottomModalSheetState extends State<CaloriesBottomModalSheet> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');

  final foodNameController = TextEditingController();
  final proteinController = TextEditingController();
  final caloriesController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  var date;
  var time;

  @override
  void dispose() {
    // TODO: implement dispose
    foodNameController.dispose();
    proteinController.dispose();
    caloriesController.dispose();
    fatController.dispose();
    carbsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    date = formatter.format(now);
    formatter = DateFormat.jms();
    time = formatter.format(now);
  }

  void addData() {
    fireStore.doc(auth.currentUser!.uid).set(
      {
        "Food Track": FieldValue.arrayUnion([
          {
            "Date": date,
            "Time": time,
            'Food Name': foodNameController.text.toString(),
            'Protein': (proteinController.text.toString()),
            'Fat': (fatController.text.toString()),
            'Carbohydrates': (carbsController.text.toString()),
            'Calories': (caloriesController.text.toString()),
          }
        ])
      },
      SetOptions(merge: true),
    ).then((value) {
      setState(() {
        loading = false;
      });
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => navBar(),
      //   ),
      // );
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      ExceptionHandle().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Add Details of the Food'),
            Form(
              key: _formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CaloriesModalSheetTextField(
                      width: MediaQuery.of(context).size.width * 0.85,
                      controller: foodNameController,
                      inputType: TextInputType.text,
                      textHint: "Food Name",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CaloriesModalSheetTextField(
                          width: MediaQuery.of(context).size.width * 0.4,
                          controller: proteinController,
                          inputType: TextInputType.number,
                          textHint: "Protein",
                        ),
                        CaloriesModalSheetTextField(
                          width: MediaQuery.of(context).size.width * 0.4,
                          controller: caloriesController,
                          inputType: TextInputType.number,
                          textHint: "Calories",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CaloriesModalSheetTextField(
                          width: MediaQuery.of(context).size.width * 0.4,
                          controller: fatController,
                          inputType: TextInputType.number,
                          textHint: "Fat",
                        ),
                        CaloriesModalSheetTextField(
                          width: MediaQuery.of(context).size.width * 0.4,
                          controller: carbsController,
                          inputType: TextInputType.number,
                          textHint: "Carbohydrates",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  addData();
                }
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Colors.green)),
                ),
              ),
              child: loading
                  ? CircularProgressIndicator()
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          "Add Data",
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
