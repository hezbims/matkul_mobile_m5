import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/article.dart';

import 'detail_page.dart';

class NewsListPage extends StatelessWidget{
  static const routeName = "/article_list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text("News App"),
      ),
      body : FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context , snapshot){
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context , index){
              return _buildArticleItem(context , articles[index]);
            }
          );
        },
      )
    );
  }
}

List<Article> parseArticles(String? json){
  if (json == null)
    return [];
  final List parsed = jsonDecode(json);
  return parsed.map(
          (jsonObjectMap) =>
              Article.fromJson(jsonObjectMap)
  ).toList();
}

Widget _buildArticleItem(BuildContext context , Article article){
  return ListTile(
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
    leading: Image.network(
      article.urlToImage,
      width: 100,
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: (){
      Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article
      );
    },
  );
}