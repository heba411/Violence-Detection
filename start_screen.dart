import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:safe_space/modules/actions/actions_screen.dart';
import 'package:safe_space/modules/stat/statistics_screen.dart';
import 'package:safe_space/modules/violence/violence_screen.dart';

class StartScreen extends StatefulWidget
{
  @override
  State<StartScreen> createState() => _StartScreenState();
}
class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context)
  {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image(
            image: AssetImage(
              'assets/images/start_screen.png',
            ),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHeight * 0.2),
            child: Text(
              'Welcome To',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHeight * 0.25),
            child: Text(
              'Vigilant Eye',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
                fontSize: 48,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHeight * 0.33),
            child: AnimatedTextKit(
                animatedTexts:[
                  TypewriterAnimatedText(
                    's t o p  v i o l e n c e',
                    textStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontFamily: 'Arial',
                    ),
                    speed: const Duration(milliseconds: 100),
            )
                ],
                // totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenHeight * 0.66),
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 2),
              builder: (context, double value, child) {
                if (value == 1.0) {
                  // Navigation logic
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => violenceScreen(),
                      ),
                    );
                  });
                }
                return Container(
                  width: screenWidth * 0.68,
                  height: screenHeight * 0.005,
                  child: LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF006a99)),
                  ),
                );
              },
            ),
          )
        ],
      ),

    );

  }
}