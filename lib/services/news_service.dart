import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/article.dart';

class NewsService {
  final String _apiKey = 'a5b8a4fda25f4c749e1a0622a3fe8310';
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List).map((article) => Article.fromJson(article)).toList();
    } else {
      print('Failed to fetch news: ${response.body}');
      throw Exception('Failed to load top headlines');
    }
  }
}