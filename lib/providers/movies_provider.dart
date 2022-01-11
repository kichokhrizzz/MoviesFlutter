import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey = '1fd9248cbe4d12cbf6402b04ddd81702';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider(){

    this.getOnDisplayMovies();
    this.getPopularMovies();

  }

  getOnDisplayMovies() async {

    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language,
      'page' : '1'
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {

    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page' : '1'
    });

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();

  }

}