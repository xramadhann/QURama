// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  Future<List<dynamic>> getNewsData() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=muslim&from=2024-05-19&sortBy=publishedAt&apiKey=e6ca956d78254d5ea9c444240d8f1062'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var articles = data['articles'] as List<dynamic>;
      return articles;
    } else {
      throw Exception('Failed to load news data');
    }
  }
}
