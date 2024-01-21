import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/network/http_helper.dart';
import 'package:news_app/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Http.init();
  // Obtain shared preferences.
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // SharedPreferences prefs;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isAppThemeDark = prefs.getBool('isDark') ?? false;
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessNews(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppToggleDarkModeThemState) {
            isAppThemeDark = state.isDarkMode;
            print("sateIsDarkMode => $isAppThemeDark");
          }
          print("isAppThemeDark => $isAppThemeDark");
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: false,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                actionsIconTheme: IconThemeData(color: Colors.black),
                iconTheme: IconThemeData(color: Colors.black),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 50,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.black,
                  ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black87,
                elevation: 0,
                centerTitle: false,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                actionsIconTheme: IconThemeData(color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 50,
                backgroundColor: Colors.black87,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
              ),
              scaffoldBackgroundColor: Colors.black87,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                  ),
            ),
            themeMode: isAppThemeDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
