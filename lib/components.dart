import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view.dart';
import 'package:news_app/shared/constants.dart';

Widget buildArticlesList(List articles){
  return ListView.separated(
    itemBuilder: (context, index) => buildArticleItem(context, articles[index]),
    separatorBuilder: (context, index) => buildArticleSeparator(),
    itemCount: articles.length
  );
}

Widget buildArticleItem(BuildContext context, Map article){
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(article['urlToImage'] ?? imgNotAvailable),
                    fit: BoxFit.cover
                )
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${article['title']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      article['publishedAt'],
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    ),
  );
}

Widget buildArticleSeparator(){
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    ),
  );
}

Widget buildLoader(){
  return const Center(
    child: CircularProgressIndicator(),
  );
}

void navigateTo(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}