import 'package:satellite/data/network/BaseApiService.dart';
import 'package:satellite/data/network/NetworkApiService.dart';
import 'package:satellite/model/customer_satellites_model.dart';

import '../res/app_url.dart';

class HomeRepository {
  final BaseApiService _baseApiService = NetworkApiService();

  Future<CustomerSatelliteListModel> customerSatellitesApi() async {
    try {
      dynamic response = await _baseApiService
          .getGetApiResponse(AppUrl.customerSatellitesEndPoint);
      return response = CustomerSatelliteListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
