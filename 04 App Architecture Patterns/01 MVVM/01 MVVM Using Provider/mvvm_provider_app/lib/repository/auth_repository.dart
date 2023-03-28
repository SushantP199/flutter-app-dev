import 'package:mvvm_provider_app/data/network/BaseApiService.dart';
import 'package:mvvm_provider_app/data/network/NetworkApiService.dart';
import 'package:mvvm_provider_app/res/app_url.dart';

class AuthRepository {

  final BaseApiService _baseApiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _baseApiService.getPostApiReponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _baseApiService.getPostApiReponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}