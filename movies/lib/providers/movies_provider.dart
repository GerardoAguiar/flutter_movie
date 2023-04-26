import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';


class MoviesProvider extends ChangeNotifier{

  String _baseUrl   = 'api.themoviedb.org';
  String _apiKey    = 'a1801c0b8d96c8c0c965c28b0f0a9a9d';
  String _language  = 'es-MX';
  
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider(){
    print('MoviesProvider Inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https( _baseUrl, endpoint, {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page'
      });
  // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      return response.body;
  }

  getOnDisplayMovies() async {

      final jsonData = await _getJsonData('3/movie/now_playing');
      final nowplayingResponse = NowPlayingResponse.fromJson(jsonData);
      
      //print(nowplayingResponse.results[1].title);
      onDisplayMovies = nowplayingResponse.results;

      notifyListeners();
  }

  getPopularMovies() async {

      _popularPage ++;
      
      final jsonData = await _getJsonData('3/movie/popular',_popularPage);
      final popularResponse = PopularResponse.fromJson(jsonData);
      
      //print(nowplayingResponse.results[1].title);
      popularMovies = [...popularMovies, ...popularResponse.results];
      print(popularMovies[0]);

      notifyListeners();

  }
}