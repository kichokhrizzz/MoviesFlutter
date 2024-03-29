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

  int _popularPage = 0;

  MoviesProvider(){

    this.getOnDisplayMovies();
    this.getPopularMovies();

  }

  Future<String> _getJsonData( String endpoint, [int page = 1] ) async {

     var url = Uri.https(_baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language': _language,
      'page' : '$page'
    });

    final response = await http.get(url);

    return response.body;

  }

  getOnDisplayMovies() async {

    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();

  }

}