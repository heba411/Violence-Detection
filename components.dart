import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController Controller,
  required String labelText,
  String? hintText,
  required TextInputType inputType,
  required String? Function(String?)?  validate,
  void Function()? onpressed,
  IconData? prefixIcon,
  IconData? suffxIcon,
  bool isPassword = false,
  bool focused = false,

}) => TextFormField(
  controller: Controller,
  decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(
          suffxIcon,
          color: Colors.white,
        ) ,
        onPressed: onpressed,
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: Colors.white,
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),

      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     width: 1.5,color: Colors.deepOrange
      //   ),
      // ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.5,color: Color(0xFF191927),
        ),
      )
  ),
  keyboardType: inputType,
  cursorColor: Color(0xFF191927),
  validator: validate,
  obscureText: isPassword,
);



Widget defaultButton({
  double width = 287,
  double height = 44,
  required Function() function,
  required String text,
  double radius = 0,
}) => MaterialButton(onPressed: function,
  child: Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Color(0xFF028BA1),
      borderRadius: BorderRadius.circular(32),
    ),

    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    ),
  ),
);