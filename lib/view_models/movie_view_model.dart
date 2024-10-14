import 'package:flutter/material.dart';
import 'package:providerpractice/data/response/api_response.dart';
import 'package:providerpractice/models/movie_model.dart';
import 'package:providerpractice/repository/movie_repo.dart';

class MovieViewModel with ChangeNotifier {
  final _movieRepo = MovieRepo();

  ApiResponse<MovieModel> movieMain = ApiResponse.loading();

  void _setMovieMain(ApiResponse<MovieModel> response) {
    movieMain = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _setMovieMain(ApiResponse.loading()); // Indicate loading state
    try {
      final value = await _movieRepo.getMovies(); // Wait for the movies list
      _setMovieMain(ApiResponse.completed(
          value)); // Success, update state with the movie list
    } catch (error) {
      _setMovieMain(ApiResponse.error(
          error.toString())); // Error occurred, update with error message
    }
  }

  printMovieDetails(dynamic data) {
    print(data.title.toString());
    notifyListeners();
  }
}
