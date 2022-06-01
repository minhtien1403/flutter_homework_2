import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../../services/api_services.dart';

class MovieDetailsTopView extends StatelessWidget {
  const MovieDetailsTopView({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                  height: 200,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${APIServices.baseImageUrl}${movie.backdropPath}'),
                          fit: BoxFit.fill))),
            ),
            Positioned(
              width: 100,
              height: 150,
              bottom: 0,
              left: 20,
              child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${APIServices.baseImageUrl}${movie.posterPath}'),
                          fit: BoxFit.fill))),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: width - 80),
                child: Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  width: 30,
                  height: 30,
                  child: Stack(
                    children: [
                      CircularProgressIndicator(
                        value: movie.voteAverage / 10,
                        color: Colors.black,
                        backgroundColor: Colors.grey,
                      ),
                      Center(
                        child: Text("${movie.voteAverage}"),
                      )
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 3 / 4);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
