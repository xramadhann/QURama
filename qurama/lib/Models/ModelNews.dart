// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  Future<List<dynamic>> getNewsData() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-05-19&sortBy=publishedAt&apiKey=e6ca956d78254d5ea9c444240d8f1062'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Failed to load surah data');
    }
  }
}
