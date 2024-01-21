abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeScreenViewState extends AppStates {}

class AppToggleDarkModeThemState extends AppStates {
  final bool isDarkMode;
  AppToggleDarkModeThemState(this.isDarkMode);
}

class AppLoadDataState extends AppStates {}

class AppGetBusinessDataSuccessState extends AppStates {}

class AppGetBusinessDataErrorState extends AppStates {
  final String error;
  AppGetBusinessDataErrorState(this.error);
}

class AppGetSportsDataSuccessState extends AppStates {}

class AppGetSportsDataErrorState extends AppStates {
  final String error;
  AppGetSportsDataErrorState(this.error);
}

class AppGetSciencesDataSuccessState extends AppStates {}

class AppGetSciencesDataErrorState extends AppStates {
  final String error;
  AppGetSciencesDataErrorState(this.error);
}

class AppGetSearchDataSuccessState extends AppStates {}

class AppGetSearchDataErrorState extends AppStates {
  final String error;
  AppGetSearchDataErrorState(this.error);
}