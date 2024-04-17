import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final List<String> _movieList = [
    'IronMan',
    'Captain Amarica',
    'Hulk',
    'Thor',
    'Ant Man',
    'Vanda',
    'Logi',
    'SpiderMan'
  ];

  List<String> get movieList => _movieList;

  List<String> loadMovie() {
    return _movieList;
  }
}
