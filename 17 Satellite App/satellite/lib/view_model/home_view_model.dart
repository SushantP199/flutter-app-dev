import 'package:flutter/foundation.dart';
import 'package:satellite/data/response/api_response.dart';
import 'package:satellite/model/customer_satellites_model.dart';
import 'package:satellite/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeRepository = HomeRepository();

  ApiResponse<CustomerSatelliteListModel> _customerSatellites =
      ApiResponse.loading();

  ApiResponse<CustomerSatelliteListModel> get customerSatellites {
    return _customerSatellites;
  }

  setCustomerSatellites(
    ApiResponse<CustomerSatelliteListModel> customerSatellites,
  ) {
    _customerSatellites = customerSatellites;
    notifyListeners();
  }

  Future<void> fetchCustomerSatellitesApi() async {
    setCustomerSatellites(ApiResponse.loading());
    _homeRepository.customerSatellitesApi().then((value) {
      setCustomerSatellites(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setCustomerSatellites(ApiResponse.error(error.toString()));
    });
  }
}
