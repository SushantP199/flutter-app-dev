import 'dart:convert';
import 'dart:io';
import 'package:satellite/data/network/BaseApiService.dart';
import 'package:satellite/data/app_exceptions.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic responseJson;

  @override
  Future getGetApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiReponse(String url, dynamic body) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: body,
          )
          .timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          "Error occured while communicating with server. status code ${response.statusCode}",
        );
    }
  }
}
