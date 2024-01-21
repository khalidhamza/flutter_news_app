import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/network/http_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/shared/constants.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get (BuildContext context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void changeBottomVanIndex({required BuildContext context, required int index}){
    bottomNavIndex = index;
    switch(index) {
      case 1: getSciencesNews(); break;
      case 2: getSportsNews(); break;
    }
    emit(AppChangeScreenViewState());
  }

  void toggleDarkMode() async
  {
    bool isDark = prefs.getBool('isDark') ?? false;
    isDark  = !isDark;
    await prefs.setBool('isDark', isDark);
    emit(AppToggleDarkModeThemState(isDark));
  }

  List<dynamic> businessNews  = [];
  void getBusinessNews(){
    emit(AppLoadDataState());
    Http.get(path: topHeadlinesApi, parameters: {
      'country':apiCountry,
      'apiKey': apiKey,
      'category': 'business'
    }).then((value){
      businessNews  = value.data['articles'];
      emit(AppGetBusinessDataSuccessState());
    }).catchError((error){
      print(error);
      emit(AppGetBusinessDataErrorState(error.toString()));
    });
  }

  List<dynamic> sportsNews  = [];
  void getSportsNews(){
    emit(AppLoadDataState());
    Http.get(path: topHeadlinesApi, parameters: {
      'country':apiCountry,
      'apiKey': apiKey,
      'category': 'sports'
    }).then((value){
      sportsNews  = value.data['articles'];
      emit(AppGetSportsDataSuccessState());
    }).catchError((error){
      print(error);
      emit(AppGetSportsDataErrorState(error.toString()));
    });
  }

  List<dynamic> sciencesNews  = [];
  void getSciencesNews(){
    emit(AppLoadDataState());
    Http.get(path: topHeadlinesApi, parameters: {
      'country':apiCountry,
      'apiKey': apiKey,
      'category': 'science'
    }).then((value){
      sciencesNews  = value.data['articles'];
      print(sciencesNews.length);
      emit(AppGetSciencesDataSuccessState());
    }).catchError((error){
      print(error);
      emit(AppGetSciencesDataErrorState(error.toString()));
    });
  }

  List<dynamic> searchNews  = [];
  void getSearchNews(String? keyword){
    emit(AppLoadDataState());
    Http.get(path: searchApi, parameters: {
      'apiKey': apiKey,
      'q': keyword
    }).then((value){
      searchNews  = value.data['articles'];
      emit(AppGetSearchDataSuccessState());
    }).catchError((error){
      print(error);
      emit(AppGetSearchDataErrorState(error.toString()));
    });
  }
}