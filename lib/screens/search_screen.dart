import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';

class SearchScreen extends StatelessWidget
{
  // const SearchScreen({super.key});

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  validator: (String? value) {
                    return value!.isEmpty ? "Search can't be empty" : null;
                  },
                  onChanged: (value){
                    appCubit.getSearchNews(value);
                  },
                ),
                Expanded(
                  child: buildArticlesList(AppCubit.get(context).searchNews)
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }
    );
  }
}