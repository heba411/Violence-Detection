import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/profile_screen.dart';
import 'package:safe_space/shared/components.dart';
import 'package:video_player/video_player.dart';
import 'package:safe_space/modules/layout/layout_screen.dart';
import 'package:safe_space/modules/upload/upload_screen.dart';

class browseScreen extends StatefulWidget
{
  @override
  State<browseScreen> createState() => _browseScreenState();
}

class _browseScreenState extends State<browseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final FilePickerResult result;
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
          onPressed: (){
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
            onPressed: (){
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
            onPressed: (){

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
              width: screenWidth * 0.75,
              height: screenWidth * 0.75,
              image: AssetImage(
                'assets/images/browse.png',
              ),
            ),
          ),
          Container(
            width: screenWidth*0.4,
            child: Text(
              'browse and choose your video file to upload',
              textAlign:TextAlign.center,
              style: TextStyle(
                color: Color(0xFF028BA1).withOpacity(0.7),
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          defaultButton(function: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.video,
            );
            if (result == null) return SizedBox();
            String videoPath = result.files.single.path!;
             uploadScreen.uploadFile(file: result);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => uploadScreen(videoPath: videoPath, result: result,),
              ),
            );

          },
              text: 'Browse'),

        ],
      ),


    );
  }
}
