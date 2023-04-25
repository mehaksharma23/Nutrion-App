// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:nutrition_app/main.dart";

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool loading = false;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _controller = CameraController(camera, ResolutionPreset.ultraHigh);
    await _controller.initialize();
  }

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras!.first,
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future<dynamic> upload(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://172.31.219.59:8000/predict");

    // create multipart request
    var request = http.MultipartRequest("GET", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: Path.basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();

    dynamic valueJson;

    valueJson = await response.stream.bytesToString();

    print('#######################$valueJson');

    return jsonDecode(valueJson);
  }

  void capture() async {
    setState(() {
      loading = true;
    });

    try {
      // await _initializeControllerFuture;

      final imageX = await _controller.takePicture();
      final path = imageX.path;

      if (!mounted) return;

      var response = await upload(File(path));

      print(response);

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              DisplayPictureScreen(imagePath: path, res: response),
        ),
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  CameraPreview(_controller),
                  // Bottom bar with capture button
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: .15 * MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: InkWell(
                        onTap: capture,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: loading
                              ? [
                                  Icon(
                                    size: 100,
                                    Icons.circle,
                                    color: Color.fromRGBO(255, 192, 184, 1),
                                  ),
                                  CircularProgressIndicator(
                                    color: Color.fromRGBO(255, 132, 115, 1),
                                  )
                                ]
                              : [
                                  Icon(
                                    size: 100,
                                    Icons.circle,
                                    color: Color.fromRGBO(255, 192, 184, 1),
                                  ),
                                  Icon(
                                    size: 50,
                                    Icons.circle,
                                    color: Color.fromRGBO(255, 132, 115, 1),
                                  ),
                                ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final dynamic res;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${res["class"]} ${(double.parse(res["confidence"]) * 100).toStringAsFixed(2)}%')),
      body: Image.file(File(imagePath)),
    );
  }
}
