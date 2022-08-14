import 'package:crypto_app/app/data/model/coin_data_model.dart';

import 'market_data_model.dart';

class Metrics {
  MarketData? marketData;

  Metrics({this.marketData});

  Metrics.fromJson(Map<String, dynamic> json) {
    marketData = MarketData.fromJson(json['market_data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (marketData != null) {
      data['market_data'] = marketData!.toJson();
    }
    return data;
  }
}
