// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/Mukul/CaloriesBottomModalSheet.dart';
import 'package:nutrition_app/Mukul/Components/CaloriesModalSheetTextFieldItems.dart';

import '../BottomNavigationBar.dart';
import '../FireBase/Auth/ExceptionHandler.dart';

class waterBottomModalSheet extends StatefulWidget {
  const waterBottomModalSheet({Key? key}) : super(key: key);

  @override
  State<waterBottomModalSheet> createState() => _waterBottomModalSheetState();
}

class _waterBottomModalSheetState extends State<waterBottomModalSheet> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');

  final waterIntakeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  var date;
  var time;

  @override
  void dispose() {
    // TODO: implement dispose
    waterIntakeController.dispose();
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
        "Water Track": FieldValue.arrayUnion([
          {
            "Date": date,
            "Time": time,
            'Intake Amount': waterIntakeController.text.toString(),
          }
        ])
      },
      SetOptions(merge: true),
    ).then((value) {
      ExceptionHandle().toastMessage("Changes will reflect in few moments");
      setState(() {
        loading = false;
      });
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
            Text('Add the amount of water taken (in mL)'),
            Form(
              key: _formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CaloriesModalSheetTextField(
                      controller: waterIntakeController,
                      textHint: "Amount (in mL)",
                      inputType: TextInputType.number,
                      width: MediaQuery.of(context).size.width * 0.5,
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
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
            ),
          ],
        ),
      ),
    );
  }
}
