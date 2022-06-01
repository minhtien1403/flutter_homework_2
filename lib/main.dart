import 'package:flutter/material.dart';
import 'package:flutter_homework_2/services/api_services.dart';
import 'package:flutter_homework_2/view/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_homework_2/view/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_homework_2/view/movie_list/movie_listview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieListViewModel()),
        ChangeNotifierProvider(create: (_) => MovieDetailsViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MovieListview(),
      ),
    );
  }
}
