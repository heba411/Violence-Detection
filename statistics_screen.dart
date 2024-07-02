import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/violence/violence_screen.dart';

import '../actions/actions_screen.dart';

class statScreen extends StatefulWidget
{
  @override
  State<statScreen> createState() => _statScreenState();
}

class _statScreenState extends State<statScreen> {
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
                'assets/images/stat.png',
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
                    'Annually, globally, violence takes 1.6 million lives, with youth homicide ranking fourth. In the US, 20% of students face bullying.',
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
                            builder: (context) => violenceScreen(),
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
                  backgroundColor: Color(0xFF015361),
                  radius: 5,
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: Color(0xFFD9EEF1),
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
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(
                            builder: (context) => actionScreen(),
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