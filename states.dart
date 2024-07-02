abstract class AppStates {}
class AppInitialState extends AppStates {}
class ChangeNavBarState extends AppStates{}
class UpdateVideoPathState extends AppStates{
  final String videoPath;
  UpdateVideoPathState(this.videoPath);
}