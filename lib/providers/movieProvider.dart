import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  // final List<String> _movieList = [
  //   'IronMan',
  //   'Captain Amarica',
  //   'Hulk',
  //   'Thor',
  //   'Ant Man',
  //   'Vanda',
  //   'Logi',
  //   'SpiderMan',
  //   'Guardians'
  // ];

  List<Movie> _movieList = [];

  List<Movie> get movieList => _movieList;

  Future<void> loadMovie(BuildContext context) async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/film.json');

      final movies = MovieParser.parse(jsonString);
      _movieList = movies;

      notifyListeners();
    } catch (e) {
      print('Error loading movies : $e');
    }
  }

  // List<Movie> loadMovie() {
  //   return _movieList;
  // }
}
