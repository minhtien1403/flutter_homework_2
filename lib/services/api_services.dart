import 'package:dio/dio.dart';
import '../model/popular_response.dart';

class APIServices {
  static String apiKey = "9898481a3f1be7af154c4d55fa677cc1";
  static String baseUrl = "https://api.themoviedb.org/3/movie";
  static String baseImageUrl = "https://image.tmdb.org/t/p/w300";
  static String popularUrlRequest = "$baseUrl/popular?api_key=$apiKey&language=en-US&page=1";
  late Dio _dio;

  APIServices() {
    _dio = Dio();
  }

  Future fetchPopularMovies() async {
    try {
      Response response = await _dio.get(popularUrlRequest);
      PopularResponse popularResponse = PopularResponse.fromJson(response.data);
      return popularResponse.results;
    } on DioError catch (e) {
      print(e);
    }
  }
}