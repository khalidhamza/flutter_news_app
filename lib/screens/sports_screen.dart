import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';

class SportsScreen extends StatelessWidget
{
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state){
          return state is! AppLoadDataState
              ? buildArticlesList(AppCubit.get(context).sportsNews)
              : buildLoader();
        },
        listener: (context, state) {
          //
        }
    );
  }
}