import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/modules/layout/layout_screen.dart';
import 'package:safe_space/modules/signup/signup_screen.dart';

import '../../shared/components.dart';

class loginScreen extends StatefulWidget
{
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var formKey1 = GlobalKey<FormState>();

  var emailControl1 = TextEditingController();

  var passControl1 = TextEditingController();
  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF028BA1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: screenHeight*0.05),
              child: Image(
                  image: AssetImage(
                    'assets/images/login.png',
                  ),
              ),
            ),
            Form(
              key: formKey1,
            child:Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20,end: 20),
                  child: defaultTextFormField(Controller: emailControl1, labelText: 'Email Address',
                    inputType: TextInputType.emailAddress, validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'This field is required';
                      }
                      return null;
                    },
                    prefixIcon: Icons.email,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20,end: 20,top: 10),
                  child: defaultTextFormField(Controller: passControl1, labelText: 'Password',
                    inputType: TextInputType.visiblePassword, validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'This field is required';
                      }
                      return null;
                    },
                    prefixIcon: Icons.lock_rounded,
                    suffxIcon: isPass?Icons.visibility : Icons.visibility_off,
                    onpressed: () {
                      setState(() {
                        isPass = !isPass;
                      });
                    },
                    isPassword: isPass,
                  ),
                ),
                SizedBox(height: 22,),
                // MaterialButton(
                //   child: Align(
                //     alignment: AlignmentDirectional.topEnd,
                //     child: Text(
                //       'Forgot Password ?',
                //       style: TextStyle(
                //         decoration: TextDecoration.underline,
                //         color: Colors.white,
                //         fontSize: 12,
                //         fontFamily: 'Roboto',
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                //   onPressed: (){
                //
                //   },
                // ),
                MaterialButton(onPressed: (){
                  if(formKey1.currentState!.validate())
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> layoutScreen()));
                  }
                },
                  child: Container(
                    width: 287,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),

                    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF028BA1),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '   or   ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.02,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  height: 50,
                  width: screenWidth*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xFF027D91),
                  ),
                ),
                SizedBox(height: screenHeight*0.01,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(
                            'assets/images/google.png',
                          ),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Gmail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  height: 50,
                  width: screenWidth*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xFF027D91),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: screenHeight*0.06,),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder:(context)=> signupScreen()));
                    },
                        child: Text('Sign Up',
                          style: TextStyle(
                              color: Color(0xFF015361),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        )
                    )
                  ],
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