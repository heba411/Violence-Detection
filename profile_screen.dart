import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/layout/layout_screen.dart';

class profileScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Center(
          child: Text(
            'Profile',
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
              Icons.person,
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF028BA1),
            ),
            width: double.infinity,
            height: 1,
          ),
          SizedBox(height: 40,),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF028BA1),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/hesham.jpeg'),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF028BA1),
              borderRadius: BorderRadius.circular(32)
            ),
            width: 300,
            height: 45,
            child: Row(
              children: [
                SizedBox(width: 1,),
                CircleAvatar(
                  child: Icon(
                    Icons.person_outline,
                      color: Color(0xFF028BA1),
                    size: 25,
                  ),
                  radius: 21,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20,),
                Text(
                  'Hesham Ayman Mohamed',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF028BA1),
                borderRadius: BorderRadius.circular(32)
            ),
            width: 300,
            height: 45,
            child: Row(
              children: [
                SizedBox(width: 1,),
                CircleAvatar(
                  child: Icon(
                    Icons.card_membership_outlined,
                    color: Color(0xFF028BA1),
                    size: 25,
                  ),
                  radius: 21,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20,),
                Text(
                  '3050456434578975',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ],
            ),

          ),
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF028BA1),
                borderRadius: BorderRadius.circular(32)
            ),
            width: 300,
            height: 45,
            child: Row(
              children: [
                SizedBox(width: 1,),
                CircleAvatar(
                  child: Icon(
                    Icons.mail_outline,
                    color: Color(0xFF028BA1),
                    size: 25,
                  ),
                  radius: 21,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20,),
                Text(
                  'heshamayman@gmail.com',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ],
            ),

          ),
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF028BA1),
                borderRadius: BorderRadius.circular(32)
            ),
            width: 300,
            height: 45,
            child: Row(
              children: [
                SizedBox(width: 1,),
                CircleAvatar(
                  child: Icon(
                    Icons.phone_android_outlined,
                    color: Color(0xFF028BA1),
                    size: 25,
                  ),
                  radius: 21,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20,),
                Text(
                  '+201053545754',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ],
            ),

          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                    borderRadius: BorderRadius.circular(32)
                ),
                width: 150,
                height: 45,
                child: Row(
                  children: [
                    SizedBox(width: 1,),
                    CircleAvatar(
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFF028BA1),
                        size: 25,
                      ),
                      radius: 21,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Edit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),

              ),
              SizedBox(width: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC62828),
                    borderRadius: BorderRadius.circular(32)
                ),
                width: 150,
                height: 45,
                child: Row(
                  children: [
                    SizedBox(width: 1,),
                    CircleAvatar(
                      child: Icon(
                        Icons.delete,
                        color: Color(0xFFC62828),
                        size: 25,
                      ),
                      radius: 21,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),

              ),

            ],
          ),

        ],
      ),
    );
  }
}