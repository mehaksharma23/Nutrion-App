// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class profileDetails extends StatefulWidget {
  const profileDetails({Key? key}) : super(key: key);

  @override
  State<profileDetails> createState() => _profileDetailsState();
}

class _profileDetailsState extends State<profileDetails> {

  final databaseRef = FirebaseDatabase.instance.ref('Customer');
  final auth =  FirebaseAuth.instance.currentUser;
  bool loading = false;

  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
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
                        databaseRef.child(auth!.uid.toString()).set({
                          'Name': postController.text.toString(),
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.6,
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
      ),
    );
  }
}
