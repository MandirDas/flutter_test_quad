import 'package:flutter_test_quad/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieService {
  static const String apiBaseUrl =
      'https://api.tvmaze.com/search/shows'; // Base

  // Fetch movies for the home screen
  static Future<List<Show>> getFeaturedMovies() async {
    final response =
        await http.get(Uri.parse('$apiBaseUrl?q=all')); // Home screen API

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map<Show>((item) {
        return Show.fromMap(item['show']);
      }).toList();
    } else {
      throw Exception('Failed to load featured movies');
    }
  }

  // Search
  static Future<List<Show>> searchMovies(String query) async {
    final response =
        await http.get(Uri.parse('$apiBaseUrl?q=$query')); // Search screen API
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map<Show>((item) {
        return Show.fromMap(item['show']);
      }).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
