// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(launchPage());
}

class launchPage extends StatefulWidget {
  const launchPage({Key? key}) : super(key: key);

  @override
  State<launchPage> createState() => _launchPageState();
}

class _launchPageState extends State<launchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Signika"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash_screen(),
      ),
    );
  }
}
