import 'package:providerpractice/data/network/base_api_service.dart';
import 'package:providerpractice/data/network/network_api_service.dart';
import 'package:providerpractice/models/movie_model.dart';

class MovieRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<MovieModel> getMovies() async {
    try {
      dynamic response = await _apiService.getResponse(
          'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/movies_list');
      return response = MovieModel.fromJson(response);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
