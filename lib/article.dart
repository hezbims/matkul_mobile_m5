import 'dart:convert';

class Article{
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
  });

  static Article fromJson(Map<String , dynamic> jsonMap){
    return Article(
        author: jsonMap["author"],
        title: jsonMap["title"],
        urlToImage: jsonMap["urlToImage"],
        publishedAt: jsonMap["publishedAt"],
        content: jsonMap["content"],
        description: jsonMap["description"],
        url: jsonMap["url"]
    );
  }
}