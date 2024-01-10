import 'dart:convert';

import '../constants.dart';
import 'package:movies_app/movie.dart';
import 'package:http/http.dart' as http;
class Api {
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants
      .apiKey}';
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants
      .apiKey}';
  static const _upComingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants
      .apiKey}';

  Future<List<Movie>?> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode==200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>?> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode==200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>?> getUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if(response.statusCode==200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }
}