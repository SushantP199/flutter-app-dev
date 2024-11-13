import 'package:satellite/data/network/BaseApiService.dart';
import 'package:satellite/data/network/NetworkApiService.dart';
import 'package:satellite/res/app_url.dart';

class AuthRepository {
  final BaseApiService _baseApiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _baseApiService.getPostApiReponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _baseApiService.getPostApiReponse(
          AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
