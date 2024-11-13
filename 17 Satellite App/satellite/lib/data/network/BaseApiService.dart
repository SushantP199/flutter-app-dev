
abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiReponse(String url, dynamic body);
}