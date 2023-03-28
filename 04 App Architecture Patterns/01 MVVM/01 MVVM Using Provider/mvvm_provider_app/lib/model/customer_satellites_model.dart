class CustomerSatelliteListModel {
  List<CustomerSatelliteModel>? customerSatellites;

  CustomerSatelliteListModel({this.customerSatellites});

  CustomerSatelliteListModel.fromJson(Map<String, dynamic> json) {
    if (json['customer_satellites'] != null) {
      customerSatellites = <CustomerSatelliteModel>[];
      json['customer_satellites'].forEach((v) {
        customerSatellites!.add(CustomerSatelliteModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerSatellites != null) {
      data['customer_satellites'] =
          customerSatellites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerSatelliteModel {
  String? id;
  String? country;
  String? launchDate;
  String? mass;
  String? launcher;

  CustomerSatelliteModel(
      {this.id, this.country, this.launchDate, this.mass, this.launcher});

  CustomerSatelliteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    launchDate = json['launch_date'];
    mass = json['mass'];
    launcher = json['launcher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['launch_date'] = launchDate;
    data['mass'] = mass;
    data['launcher'] = launcher;
    return data;
  }
}
