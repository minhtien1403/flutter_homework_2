import 'package:flutter/material.dart';
import 'package:flutter_homework_2/view/movie_details/movie_details_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../model/movie.dart';

class MovieDetailsBodyView extends StatelessWidget {
  const MovieDetailsBodyView({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    MovieDetailsViewModel movieDetailsViewModel =
        context.watch<MovieDetailsViewModel>();
    movieDetailsViewModel.fetchGenre();
    String genre = "";
    movieDetailsViewModel.gernes.forEach(
      (element) => {
        if (movie.genreIds.first == element.id) {genre = element.name}
      },
    );
    return Column(
      children: [
        Container(
          width: width,
          height: 0.5,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset('assets/images/chat.png'),
                ),
                const Text("Reviews")
              ],
            ),
            Container(
              width: 0.5,
              height: 60,
              color: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/images/play.png'),
                ),
                const Text("Trailers")
              ],
            )
          ],
        ),
        Container(
          width: width,
          height: 0.5,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
              width: width / 2,
              child: Column(
                children: [
                  const Text(
                    "Gerne",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(genre)
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: width / 2,
              child: Column(
                children: [
                  const Text(
                    "Realease",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(DateFormat('yyyy-MM-dd').format(movie.releaseDate))
                ],
              ),
            )
          ],
        ),
        Container(
          width: width,
          height: 0.5,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Text(
            movie.overview,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        )
      ],
    );
  }
}
