import 'dart:io';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../upload/upload_screen.dart';

class layoutScreen extends StatefulWidget
{
  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {

  List<bool> isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context) => AppCubit()..initializeScreens(),
            child: BlocConsumer<AppCubit, AppStates>(
                listener: (context, state) {},
                builder: (context,state) => Scaffold(
                  body: BuildCondition(
                    condition: true ,
                    builder: (context) => AppCubit.get(context).screens[AppCubit.get(context).currIndx],
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFF028BA1), width: 1),
                      ),
                    ),
                    child: BottomNavigationBar(
                      elevation: 20,
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      iconSize: 30,
                      currentIndex: AppCubit.get(context).currIndx,
                      selectedItemColor: Color(0xFF028BA1),
                      unselectedLabelStyle: TextStyle(
                        color: Color(0xFFD9D9D9),
                      ),
                      onTap: (index) async {
                        AppCubit.get(context).changeIndex(index);
                        setState(() {
                          for (var i = 0; i <= 4; i++) {
                            if(i==index)
                              {
                                isSelected[i] = true;
                              }
                            else
                              isSelected[i] = false;
                          }
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: isSelected[0]
                              ? Icon(
                            Icons.home,
                            color: Color(0xFF028BA1),
                          )
                              : Icon(
                            Icons.home_outlined,
                            color: Color(0xFF028BA1),
                          ),
                          label: 'home',
                        ),
                        BottomNavigationBarItem(
                          icon: isSelected[1]
                              ? Icon(
                            Icons.camera_alt,
                            color: Color(0xFF028BA1),
                          )
                              : Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF028BA1),
                          ),
                          label: 'live',
                        ),
                        BottomNavigationBarItem(
                          icon: isSelected[2]
                              ? Icon(
                            Icons.upload,
                            color: Color(0xFF028BA1),
                          )
                              : Icon(
                            Icons.upload_outlined,
                            color: Color(0xFF028BA1),
                          ),
                          label: 'upload',
                        ),
                        BottomNavigationBarItem(
                          icon: isSelected[3]
                              ? Icon(
                            Icons.report,
                            color: Color(0xFF028BA1),
                          )
                              : Icon(
                            Icons.report_gmailerrorred_outlined,
                            color: Color(0xFF028BA1),
                          ),
                          label: 'report',
                        ),
                        BottomNavigationBarItem(
                          icon: isSelected[4]
                              ? Icon(
                            Icons.sos_outlined,
                            color: Color(0xFF028BA1),
                          )
                              : Icon(
                            Icons.sos,
                            color: Color(0xFF028BA1),
                          ),
                          label: 'sos',
                        ),
                      ],
                    ),
                  ),
                )
            ),

    );
  }
}