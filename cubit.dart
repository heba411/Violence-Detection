import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_space/cubit/states.dart';
import 'package:safe_space/modules/browse_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/prevActions/prevActionScreen.dart';
import '../modules/sos/sos_screen.dart';
import '../modules/startLive/startLive_screen.dart';
import '../modules/upload/upload_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);


  bool isShown = false;
  String videoPath = "";
  int currIndx = 0;
  List<Widget> screens = [];

  void initializeScreens() {
    screens = [
      homeScreen(),
      startLiveScreen(), //live
      browseScreen(),
      // uploadScreen(videoPath: videoPath),
      prevActionScreen(), //reports
      sosScreen(),
    ];
  }
  void setVideoPath(String path) {
    videoPath = path;
    initializeScreens();
    emit(UpdateVideoPathState(path));
  }

  void changeIndex(int indx)
  {
    currIndx = indx;
    emit(ChangeNavBarState());
  }



}