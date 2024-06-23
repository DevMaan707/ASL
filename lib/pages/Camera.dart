import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String? _videoPath;
  int _remainingTime = 5;
  Timer? _timer;

  _CameraState() {
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    return _controller.initialize();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _recordVideo() async {
    try {
      await _initializeControllerFuture;
      final appDir = await getTemporaryDirectory();
      final fileName = 'video_${DateTime.now().millisecondsSinceEpoch}.mp4';
      final videoPath = join(appDir.path, fileName);

      await _controller.startVideoRecording();

      setState(() {
        _remainingTime = 5;
      });

      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (_remainingTime < 1) {
            timer.cancel();
            _stopVideoRecording();
          } else {
            _remainingTime--;
          }
        });
      });
    } catch (e) {
      print("Error recording video: $e");
    }
  }

  Future<void> _stopVideoRecording() async {
    try {
      XFile videoFile = await _controller.stopVideoRecording();

      setState(() {
        _videoPath = videoFile.path;
      });

      // Check if the file exists after recording
      if (File(_videoPath!).existsSync()) {
        print("Video recorded and saved at: $_videoPath");
      } else {
        print("Video file does not exist at the path: $_videoPath");
      }
    } catch (e) {
      print("Error stopping video recording: $e");
    }
  }

  Future<void> _sendVideo() async {
    if (_videoPath != null) {
      if (File(_videoPath!).existsSync()) {
        try {
          final url = Uri.parse('http://3.86.147.91:3000/predict');
          final request = http.MultipartRequest('POST', url);
          request.files.add(await http.MultipartFile.fromPath('video', _videoPath!));

          final response = await http.Response.fromStream(await request.send());
          if (response.statusCode == 200) {
            print("Video uploaded successfully");

          } else {
            print("Failed to upload video: ${response.statusCode}");
          }
        } catch (e) {
          print("Error sending video: $e");
        }
      } else {
        print("Video file does not exist at the path: $_videoPath");
      }
    } else {
      print("No video recorded");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      CameraPreview(_controller),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: _remainingTime > 0
                            ? Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.black54,
                          child: Text(
                            '$_remainingTime',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        )
                            : SizedBox.shrink(),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  await _recordVideo();
                },
                icon: Icon(Icons.videocam_outlined), // Camera outline icon for record
              ),
              _videoPath != null
                  ? IconButton(
                onPressed: () async {
                  await _sendVideo();
                },
                icon: Icon(Icons.send), // Send icon for send button
              )
                  : SizedBox(), // Show the IconButton only when a video is recorded
            ],
          ),
        ],
      ),
    );
  }
}
// void main(){
//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   runApp(const Camera1());
// }
// class Camera1 extends StatelessWidget {
//   const Camera1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: const Camera(),
//     );
//   }
// }
