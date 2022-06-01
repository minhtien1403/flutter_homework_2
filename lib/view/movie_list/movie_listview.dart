import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/movie.dart';
import 'package:provider/provider.dart';

import 'movie_list_viewmodel.dart';
import 'movie_listview_item.dart';

class MovieListview extends StatelessWidget {
  const MovieListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListViewModel movieListViewModel = context.watch<MovieListViewModel>();
    movieListViewModel.fetchPopularMovies();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "POPULAR",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: movieListViewModel.movies.length,
          itemBuilder: (context, index) {
            Movie movie = movieListViewModel.movies[index];
            return MovieListViewItem(movie: movie);
          },
        ));
  }
}
