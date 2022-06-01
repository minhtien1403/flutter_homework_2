import 'package:flutter/material.dart';
import 'package:flutter_homework_2/view/movie_list_viewmodel.dart';
import 'package:flutter_homework_2/view/movie_listview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MovieListViewModel()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieListview(),
    ),
    );
  }
}
