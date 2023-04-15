// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:nutrition_app/Naman/Camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Camera(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("access was denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          child: CameraPreview(_controller),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () async {
                      if (!_controller.value.isInitialized) {
                        return null;
                      }
                      if (_controller.value.isTakingPicture) {
                        return null;
                      }
                      try {
                        await _controller.setFlashMode(FlashMode.auto);
                        XFile file = await _controller.takePicture();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImagePreview(file),
                          ),
                        );
                      } on CameraException catch (e) {
                        debugPrint("Error occured while taking picture : $e");
                        return null;
                      }
                    },
                    enableFeedback: false,
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
