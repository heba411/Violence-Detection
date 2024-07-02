import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/login/login_screen.dart';
import 'package:safe_space/modules/profile_screen.dart';
import 'package:safe_space/modules/violence_types/violenceTypes_screen.dart';

class homeScreen extends StatelessWidget
{
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
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => loginScreen(),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                'Hello,',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF028BA1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                'Hesham',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF028BA1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                'Let\'s make it a peaceful world',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFF028BA1).withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.02,),
            Center(
              child: Container(
                width: screenWidth * 0.88,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(0xFF028BA1).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(
                      Icons.search,
                      color: Color(0xFF028BA1),
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.2),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.02 ,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => violenceTypesScreen(),
                  ),
                );
              },
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        width: screenWidth * 0.88,height: screenWidth * 0.6,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/hand.jpg'
                        ),
                      ),
                    ),
                    Container(
                      width:screenWidth * 0.88, height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF026879).withOpacity(0.6),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(vertical: 4),
                        child: Text(
                          'Violence & Types',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.02 ,),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      width: screenWidth * 0.88,height: screenWidth * 0.6,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/physical.jpg'
                      ),
                    ),
                  ),
                  Container(
                    width:screenWidth * 0.88, height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF026879).withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 4),
                      child: Text(
                        'Violence Examples',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.02 ,),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      width: screenWidth * 0.88,height: screenWidth * 0.6,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/reported.jpeg'
                      ),
                    ),
                  ),
                  Container(
                    width:screenWidth * 0.88, height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF026879).withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 4),
                      child: Text(
                        'Previous Reports',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.02 ,),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      width: screenWidth * 0.88,height: screenWidth * 0.6,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/about.jpg'
                      ),
                    ),
                  ),
                  Container(
                    width:screenWidth * 0.88, height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF026879).withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 4),
                      child: Text(
                        'About Vigilant Eye',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}