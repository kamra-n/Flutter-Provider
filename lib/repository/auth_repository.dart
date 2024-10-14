import 'package:providerpractice/data/network/base_api_service.dart';
import 'package:providerpractice/data/network/network_api_service.dart';

class AuthRepository {
  // ignore: prefer_final_fields
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postResponse(
          'https://cadpro.org.uk/profile/api/agents/login', data);
      return response;
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
