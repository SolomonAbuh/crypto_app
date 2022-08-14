import 'package:crypto_app/app/data/model/coin_data_details_model.dart';
import 'package:crypto_app/app/data/model/status_model.dart';

class CoinData {
  Status? status;
  List<Data>? data;

  CoinData({this.status, this.data});

  CoinData.fromJson(Map<String, dynamic> json) {
    status = Status.fromJson(json['status']);
    data = <Data>[];
    json['data'].forEach((v) {
      data!.add(Data.fromJson(v));
    });
  }
}
