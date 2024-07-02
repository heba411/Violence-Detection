import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/browse_screen.dart';
import 'package:safe_space/modules/layout/layout_screen.dart';
import 'package:safe_space/shared/components.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import '../profile_screen.dart';


class uploadScreen extends StatefulWidget {
  final String videoPath;
  final FilePickerResult result;

  const uploadScreen({
    Key? key,
    required this.videoPath,
    required this.result,
  }) : super(key: key);

  @override
  State<uploadScreen> createState() => _uploadScreenState();

  static Future<List<dynamic>> uploadFile(
      {required FilePickerResult file}) async
  {
    var predictions;
    var fille = File(file.files.single.path!);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://2e4e-35-245-59-75.ngrok-free.app/"),
    );
    var stream = http.ByteStream(fille.openRead());
    var length = await fille.length();
    var flag = false;

    request.files.add(
      http.MultipartFile(
        'video',
        stream,
        length,
        filename: file.files.single.name,
      ),
    );

    var response = await request.send();
    try {
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        predictions = json.decode(responseBody);
        print('Video uploaded successfully');
        flag = true;
        //somethingf
      } else {
        print('Failed to upload video: ${response.reasonPhrase}');
        print("STATUS CODE IS ${response.statusCode}");
      }
    } catch (e) {
      print('Error uploading video: $e');
    }
    return [predictions['prediction'], flag];
  }

  // static Future<List<dynamic>> uploadFile({required FilePickerResult result}) async {
  //   // Initialize the interpreter
  //   final interpreter = await tfl.Interpreter.fromAsset('model.tflite');
  //   for (var file in result.files) {
  //     Uint8List? fileBytes;
  //     if (file.bytes != null) {
  //       fileBytes = file.bytes;
  //     } else if (file.path != null) {
  //       fileBytes = await File(file.path!).readAsBytes();
  //     }
  //     List<double> flattenedInput = [];
  //     for (int byte in fileBytes!) {
  //       flattenedInput.add(byte / 255.0); // Normalize to range [0, 1]
  //     }
  //
  //     print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
  //     print(fileBytes);
  //
  //     var reshapedInput = List.generate(1, (index) =>
  //         List.generate(30, (index) =>
  //             List.generate(224, (index) =>
  //                 List.generate(224, (index) =>
  //                     List.generate(3, (index) => 0.0)))))[0];
  //     for (int i = 0; i < flattenedInput.length; i++) {
  //       reshapedInput[i ~/ (224 * 224 * 3)][(i ~/ (224 * 3)) % 224][(i ~/ 3) % 224][i % 3] = flattenedInput[i];
  //     }
  //
  //     var output = List.filled(1, 0).reshape([1, 1]);
  //     interpreter.run(reshapedInput, output);
  //     print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
  //     print(output[0][0]);
  //     if(output[0][0]>0.5)
  //       {
  //         return ['Violent',true];
  //       }
  //     else
  //       {
  //         return ['Nonviolent',true];
  //       }
  //   }
  //   return ['',true];
  // }

}

class _uploadScreenState extends State<uploadScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.file(File(widget.videoPath)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String> getPrediction() async {
    final predictions = await uploadScreen.uploadFile(file: widget.result);
    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
    print(predictions);
    print(predictions[0]);
    return predictions[0];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<String>(
      future: getPrediction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
                      builder: (context) => browseScreen(),
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
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                  ),
                  width: double.infinity,
                  height: 1,
                ),
                Center(
                  child: Image(
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    image: AssetImage(
                      'assets/images/browse.png',
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.4,
                  child: Text(
                    'browse and choose your video file to upload',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF028BA1).withOpacity(0.7),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                defaultButton(
                    function: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.video,
                      );
                      if (result == null) return SizedBox();
                      String videoPath = result.files.single.path!;
                      uploadScreen.uploadFile(file: result);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => uploadScreen(
                            videoPath: videoPath,
                            result: result,
                          ),
                        ),
                      );
                    },
                    text: 'Browse'),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Uploading Video....',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF028BA1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Color(0xFF028BA1),
            appBar: AppBar(
              backgroundColor: Color(0xFF028BA1),
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => browseScreen(),
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
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                  ),
                  width: double.infinity,
                  height: 1,
                ),
                Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              ],
            ),
          );
        } else {
          final prediction = snapshot.data != null ? snapshot.data : '';
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
                      builder: (context) => browseScreen(),
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu_sharp,
                    color: Color(0xFF028BA1),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                  ),
                  width: double.infinity,
                  height: 1,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      width: 300,
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: FlickVideoPlayer(
                          flickManager: flickManager,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  prediction!,
                  style: TextStyle(
                    color: (prediction == 'Violence')
                        ? Color(0xFFC62828)
                        : Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 290,
                  child: Text(
                    (prediction == 'Violence')
                        ? 'Your Report Will Be Sent After 20 Sec...'
                        : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF028BA1),
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                defaultButton(
                    function: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.video,
                      );
                      if (result == null) return SizedBox();
                      String videoPath = result.files.single.path!;
                      uploadScreen.uploadFile(file: result);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => uploadScreen(
                            videoPath: videoPath,
                            result: result,
                          ),
                        ),
                      );
                    },
                    text: 'Browse Another Video'),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => layoutScreen()));
                  },
                  child: Container(
                    width: 287,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xFFC62828),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
