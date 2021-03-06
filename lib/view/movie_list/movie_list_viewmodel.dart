import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/gerne.dart';
import 'package:flutter_homework_2/model/movie.dart';
import 'package:flutter_homework_2/services/api_services.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> movies = <Movie>[];
  List<Gerne> gernes = <Gerne>[];

  Future<void> fetchPopularMovies() async {
    final results = await APIServices().fetchPopularMovies();
    movies = results as List<Movie>;
    notifyListeners();
  }

  Future<void> fetchGenre() async {
    final results = await APIServices().fetchGenre();
    gernes = results as List<Gerne>;
    notifyListeners();
  }
}
