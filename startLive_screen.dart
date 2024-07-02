import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/layout/layout_screen.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../profile_screen.dart';
import '../violent_video_screen.dart';

class startLiveScreen extends StatefulWidget {
  @override
  State<startLiveScreen> createState() => _startLiveScreenState();
}

class _startLiveScreenState extends State<startLiveScreen> {
  CameraController? cameraController;
  String prediction = "";
  bool isRecording = false;
  XFile? recordedVideo;
  bool detecting = false;
  bool violenceDetected = false;
  bool imageStreamActive = false;

  @override
  void initState() {
    super.initState();
    loadCamera();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  void loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if (!mounted) return;
      setState(() {
        startImageStream();
        _showDetectDialog();
      });
    });
  }

  void startImageStream() {
    if (!imageStreamActive) {
      cameraController!.startImageStream((imageStream) {});
      imageStreamActive = true;
    }
  }

  void stopImageStream() {
    if (imageStreamActive) {
      cameraController!.stopImageStream();
      imageStreamActive = false;
    }
  }

  Future<void> startVideoRecording() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      if (cameraController!.value.isRecordingVideo) {
        return;
      }
      try {
        stopImageStream();
        await cameraController!.startVideoRecording();
        setState(() {
          isRecording = true;
        });
        print("RECORDDDDDDDDDDDDDDDDDD");
        await Future.delayed(Duration(seconds: 5));
        await stopVideoRecording();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> stopVideoRecording() async {
    if (cameraController != null && cameraController!.value.isRecordingVideo) {
      try {
        recordedVideo = await cameraController!.stopVideoRecording();
        setState(() {
          isRecording = false;
        });
        print("STOPPPPPPPP");
        print("Video recorded to: ${recordedVideo?.path}");
        await runModel(recordedVideo!);
        if (!violenceDetected && detecting) {
          startImageStream();
          await Future.delayed(Duration(seconds: 1)); // Short delay to restart stream
          startVideoRecording();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> runModel(XFile videoFile) async {
    var predictions;
    var file = File(videoFile.path);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://7b77-34-83-43-48.ngrok-free.app/"),
    );
    var stream = http.ByteStream(file.openRead());
    var length = await file.length();
    request.files.add(
      http.MultipartFile(
        'video',
        stream,
        length,
        filename: videoFile.name,
      ),
    );

    var response = await request.send();
    try {
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        predictions = json.decode(responseBody);
        print('Video uploaded successfully');
        print(predictions);
        setState(() {
          prediction = predictions['prediction'];
        });
        if (prediction == "Violence") {
          violenceDetected = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViolentVideoScreen(videoPath: videoFile.path,),
            ),
          );
          // _showReportDialog(videoFile);
        }
      } else {
        print('Failed to upload video: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading video: $e');
    }
  }

  void _showDetectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Detection"),
          content: Text("Do you want to start detecting violence?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  detecting = true;
                  startVideoRecording();
                });
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  void _showReportDialog(XFile videoFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Violence Detected"),
          content: Text("Violence detected. Do you want to report this video?"),
          actions: [
            TextButton(
              onPressed: () {
                // Handle reporting
                Navigator.of(context).pop();
              },
              child: Text("Report"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Keep the video and continue detecting
                setState(() {
                  violenceDetected = false;
                  startVideoRecording();
                });
              },
              child: Text("Ignore"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF028BA1),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => layoutScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => profileScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.person_outline,
              color: Color(0xFF028BA1),
            ),
          ),
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.menu_sharp,
              color: Color(0xFF028BA1),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: screenHeight * 0.55,
                width: screenWidth,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                  aspectRatio: cameraController!.value.aspectRatio,
                  child: CameraPreview(cameraController!),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            prediction,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: prediction == "Violence" ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
