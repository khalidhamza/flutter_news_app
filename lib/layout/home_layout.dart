import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeLayout extends StatelessWidget
{
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: (){
                  appCubit.toggleDarkMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: appCubit.screens[appCubit.bottomNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: appCubit.bottomNavIndex,
            onTap: (index){
              appCubit.changeBottomVanIndex(context: context, index: index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Business',
                icon: Icon(Icons.business_center),
              ),
              BottomNavigationBarItem(
                  label: 'Science',
                  icon: Icon(Icons.science)
              ),
              BottomNavigationBarItem(
                  label: 'Sports',
                  icon: Icon(Icons.sports)
              ),
            ],
          ),
        );
      },
    );
  }

}
