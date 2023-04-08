// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/BottomNavigationBar.dart';
import 'package:nutrition_app/FireBase/Auth/ExceptionHandler.dart';
import 'package:nutrition_app/Mukul/Home.dart';

class profileDetails extends StatefulWidget {
  const profileDetails({Key? key}) : super(key: key);

  @override
  State<profileDetails> createState() => _profileDetailsState();
}

class _profileDetailsState extends State<profileDetails> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');

  bool loading = false;

  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Full Name",
                    ),
                    controller: postController,
                    maxLines: 3,
                  ),
                  TextButton(
                    onPressed: () {
                      fireStore
                          .doc(auth.currentUser!.uid)
                          .set({
                            "ID": auth.currentUser!.uid,
                            "Name": postController.text.toString(),
                          })
                          .then((value) {})
                          .onError((error, stackTrace) {
                            ExceptionHandle().toastMessage(error.toString());
                          });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => navBar()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Text(
                        "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
