import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';

class ScienceScreen extends StatelessWidget
{
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state){
          return state is! AppLoadDataState
              ? buildArticlesList(AppCubit.get(context).sciencesNews)
              : buildLoader();
        },
        listener: (context, state) {
          //
        }
    );
  }
}