// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutrition_app/BottomNavigationBar.dart';
import 'package:nutrition_app/FireBase/Auth/ExceptionHandler.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class profileDetails extends StatefulWidget {
  const profileDetails({Key? key}) : super(key: key);

  @override
  State<profileDetails> createState() => _profileDetailsState();
}

class _profileDetailsState extends State<profileDetails> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  bool loading = false;

  final postController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image picked');
      }
    });
  }

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
                  InkWell(
                    onTap: () {
                      getImageGallery();
                    },
                    child: _image != null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(File(_image!.path)),
                          )
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage('assets/anonymous.jpg'),
                          ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Full Name",
                    ),
                    controller: postController,
                    maxLines: 3,
                  ),
                  TextButton(
                    onPressed: () async {
                      firebase_storage.Reference ref = firebase_storage
                          .FirebaseStorage.instance
                          .ref('/${auth.currentUser!.uid}/ Profile_Picture');
                      firebase_storage.UploadTask uploadTask =
                          ref.putFile(_image!.absolute);

                      await Future.value(uploadTask).then((value) async {
                        var newUrl = await ref.getDownloadURL();
                        fireStore
                            .doc(auth.currentUser!.uid)
                            .set({
                              "ID": auth.currentUser!.uid,
                              "Name": postController.text.toString(),
                              "ProfilePic": newUrl.toString(),
                            })
                            .then((value) {})
                            .onError((error, stackTrace) {
                              ExceptionHandle().toastMessage(error.toString());
                            });
                      });

                      // fireStore
                      //     .doc(auth.currentUser!.uid)
                      //     .set({
                      //       "ID": auth.currentUser!.uid,
                      //       "Name": postController.text.toString(),
                      //       "ProfilePic" : newUrl.toString(),
                      //     })
                      //     .then((value) {})
                      //     .onError((error, stackTrace) {
                      //       ExceptionHandle().toastMessage(error.toString());
                      //     });
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
