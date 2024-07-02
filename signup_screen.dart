import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:safe_space/cubit/cubit.dart';
import 'package:safe_space/modules/actions/actions_screen.dart';
import 'package:safe_space/shared/components.dart';
import '../login/login_screen.dart';

class CountrySingleton {
  static final CountrySingleton _instance = CountrySingleton._internal();
  String? _country;

  factory CountrySingleton() {
    return _instance;
  }

  CountrySingleton._internal();

  String? get country => _country;
  void setCountry(String country) {
    _country = country;
  }
}

class signupScreen extends StatefulWidget
{
  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  var emailControl = TextEditingController();
  var passControl = TextEditingController();
  var passconfirmControl = TextEditingController();
  var nameControl = TextEditingController();
  var phoneControl = TextEditingController();
  var nationalidControl = TextEditingController();
  var countryControl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF028BA1),
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Color(0xFF028BA1),
      //     ),
      //     onPressed: ()=> Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => actionScreen(),
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'SignUp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF028BA1),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                width: double.infinity,
                height: screenHeight*0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(500) ,bottomEnd: Radius.circular(500)),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 40,start: 20,end: 20),
                child: defaultTextFormField(Controller: nameControl, labelText: 'Full Name',
                    inputType: TextInputType.text, validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'This field is required';
                      }
                      return null;
                    },
                  prefixIcon: Icons.person,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,end: 20,top: 10),
                child: defaultTextFormField(Controller: nationalidControl, labelText: 'National ID',
                  inputType: TextInputType.number, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'This field is required';
                    }
                    return null;
                  },
                  prefixIcon: Icons.person_pin,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,end: 20,top: 10),
                child: defaultTextFormField(Controller: emailControl, labelText: 'Email Address',
                  inputType: TextInputType.emailAddress, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'This field is required';
                    }
                    return null;
                  },
                  prefixIcon: Icons.email,
                  hintText: 'xxx..@example.com'
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,end: 20,top: 10),
                child: IntlPhoneField(
                  controller: phoneControl,
                  decoration: InputDecoration(
                    hintText: '1xxxxxxxxx',
                    hintStyle:TextStyle(
                      color: Colors.white.withOpacity(0.6),
                    ),
                    prefixIcon: Icon(
                      Icons.phone_in_talk_outlined,
                      color: Colors.white,
                    ),
                    labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,color: Color(0xFF191927),
                        ),
                      )
                  ),
                  initialCountryCode: 'EG',
                  cursorColor: Color(0xFF191927),
                  onCountryChanged: (phone)
                  {
                    setState(()
                    {
                      var country = phone.name;
                      print("Selected Country: $country");
                      CountrySingleton().setCountry(country);

                    });
                    // country = phone.code;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,end: 20),
                child: defaultTextFormField(Controller: passControl, labelText: 'Password',
                  inputType: TextInputType.visiblePassword, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'This field is required';
                    }
                    return null;
                  },
                    isPassword: isPass,
                  prefixIcon: Icons.lock_rounded,
                  suffxIcon: isPass?Icons.visibility : Icons.visibility_off,
                  onpressed: () {
                    setState(() {
                      isPass = !isPass;
                    });
                  }
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,end: 20,top: 10),
                child: defaultTextFormField(Controller: passconfirmControl, labelText: 'Confirm Password',
                  inputType: TextInputType.visiblePassword, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'This field is required';
                    }
                    return null;
                  },
                    isPassword: isPass,
                  prefixIcon: Icons.lock_rounded,
                  suffxIcon: isPass?Icons.visibility : Icons.visibility_off,
                  onpressed: () {
                    setState(() {
                      isPass = !isPass;
                    });
                  }
                ),
              ),
              SizedBox(height: 25),
              MaterialButton(onPressed: (){
                if(formKey.currentState!.validate())
                {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginScreen()));
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF028BA1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:(context)=> loginScreen()));
                  },
                      child: Text('Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF015361),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Container(
                  width: screenWidth*0.18,
                  height: screenHeight*0.1,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(60)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}