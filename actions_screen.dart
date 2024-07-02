import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/signup/signup_screen.dart';
import 'package:safe_space/modules/stat/statistics_screen.dart';

class actionScreen extends StatefulWidget
{
  @override
  State<actionScreen> createState() => _actionScreenState();
}

class _actionScreenState extends State<actionScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF028BA1),
      body: Column(
        children: [
          SizedBox(height: screenHeight*0.1,),
          Center(
            child: Image(
              alignment: AlignmentDirectional.topCenter,
              width: screenWidth * 0.6,
              height: screenWidth * 0.6,
              image: AssetImage(
                'assets/images/stopvv.png',
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Center(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                color: Color(0xFF015361).withOpacity(0.5),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Text(
                    'We have to act now to stop violence. Raise awareness, promote empathy, and support victims. Together, we can create a safer, more peaceful world.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ),
          ),
          SizedBox(height: screenHeight * 0.18,),
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth*0.0233,),
                Container(
                  width: 44,
                  height: 46,
                  decoration: BoxDecoration(
                      color: Color(0xFF015361),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                      onPressed: ()=>{
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => statScreen(),
                          ),
                        ),
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        // color: Color(0xFF015361),
                        size: 25,
                      )
                  ),
                ),
                SizedBox(width: screenWidth * 0.3,),
                CircleAvatar(
                  backgroundColor: Color(0xFFD9EEF1),
                  radius: 5,
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: Color(0xFFD9EEF1),
                  radius: 5,
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: Color(0xFF015361),
                  radius: 5,
                ),
                SizedBox(width: screenWidth * 0.3,),
                Container(
                  width: 44,
                  height: 46,
                  decoration: BoxDecoration(
                      color: Color(0xFF015361),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                      onPressed: ()=>{
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signupScreen(),
                          ),
                        ),
                      },
                      icon: Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                        // color: Color(0xFF015361),
                        size: 25,
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}