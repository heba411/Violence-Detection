import 'dart:io';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/startLive/startLive_screen.dart';
import 'package:safe_space/shared/components.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ViolentVideoScreen extends StatefulWidget {
  final String videoPath;

  const ViolentVideoScreen({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ViolentVideoScreen> createState() => _ViolentVideoScreenState();
}

class _ViolentVideoScreenState extends State<ViolentVideoScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.file(File(widget.videoPath)),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  sendEmail() async {
    final Email email = Email(
      body:
      'Hello,'
          'There is a violent',
      subject: 'Violence occurrence',
      recipients: ['heba65564@gmail.com'],
      //cc: ['cc@example.com'],
      //bcc: ['bcc@example.com'],
      //attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => startLiveScreen(),
              ),
            );
          },
        ),
        title: Center(
          child: Text(
            'Violent Clip',
          style: TextStyle(
            color: Color(0xFF028BA1),
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
          SizedBox(height: 30,),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 400,
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
          SizedBox(height: 30,),
          defaultButton(function: (){
            sendEmail();

          }, text: 'Report'),
        ],
      ),
    );
  }
}
