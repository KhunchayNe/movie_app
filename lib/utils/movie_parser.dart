import 'dart:convert';

import 'package:movie_app/models/movie.dart';

class MovieParser {
  static List<Movie> parse(String jsonString) {
    final List<dynamic> parserJsonList = json.decode(jsonString);
    return parserJsonList
        .cast()
        .map((jsonItem) => Movie.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
