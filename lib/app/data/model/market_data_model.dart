class MarketData {
  String? priceUsd;
  String? priceBtc;
  String? priceEth;
  num? volumeLast24Hours;
  num? realVolumeLast24Hours;
  num? volumeLast24HoursOverstatementMultiple;
  num? percentChangeUsdLast1Hour;
  num? percentChangeBtcLast1Hour;
  num? percentChangeEthLast1Hour;
  num? percentChangeUsdLast24Hours;
  num? percentChangeBtcLast24Hours;
  num? percentChangeEthLast24Hours;
  num? ohlcvLast24Hour;
  String? lastTradeAt;

  MarketData(
      {this.priceUsd,
      this.priceBtc,
      this.priceEth,
      this.volumeLast24Hours,
      this.realVolumeLast24Hours,
      this.volumeLast24HoursOverstatementMultiple,
      this.percentChangeUsdLast1Hour,
      this.percentChangeBtcLast1Hour,
      this.percentChangeEthLast1Hour,
      this.percentChangeUsdLast24Hours,
      this.percentChangeBtcLast24Hours,
      this.percentChangeEthLast24Hours,
      this.ohlcvLast24Hour,
      this.lastTradeAt});

  MarketData.fromJson(Map<String, dynamic> json) {
    priceUsd = json['price_usd'].toString();
    priceBtc = json['price_btc'].toString();
    priceEth = json['price_eth'].toString();
    volumeLast24Hours = json['volume_last_24_hours'];
    realVolumeLast24Hours = json['real_volume_last_24_hours'];
    volumeLast24HoursOverstatementMultiple =
        json['volume_last_24_hours_overstatement_multiple'];
    percentChangeUsdLast1Hour = json['percent_change_usd_last_1_hour'];
    percentChangeBtcLast1Hour = json['percent_change_btc_last_1_hour'];
    percentChangeEthLast1Hour = json['percent_change_eth_last_1_hour'];
    percentChangeUsdLast24Hours = json['percent_change_usd_last_24_hours'];
    percentChangeBtcLast24Hours = json['percent_change_btc_last_24_hours'];
    percentChangeEthLast24Hours = json['percent_change_eth_last_24_hours'];
    ohlcvLast24Hour = json['ohlcv_last_24_hour'];
    lastTradeAt = json['last_trade_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price_usd'] = priceUsd;
    data['price_btc'] = priceBtc;
    data['price_eth'] = priceEth;
    data['volume_last_24_hours'] = volumeLast24Hours;
    data['real_volume_last_24_hours'] = realVolumeLast24Hours;
    data['volume_last_24_hours_overstatement_multiple'] =
        volumeLast24HoursOverstatementMultiple;
    data['percent_change_usd_last_1_hour'] = percentChangeUsdLast1Hour;
    data['percent_change_btc_last_1_hour'] = percentChangeBtcLast1Hour;
    data['percent_change_eth_last_1_hour'] = percentChangeEthLast1Hour;
    data['percent_change_usd_last_24_hours'] = percentChangeUsdLast24Hours;
    data['percent_change_btc_last_24_hours'] = percentChangeBtcLast24Hours;
    data['percent_change_eth_last_24_hours'] = percentChangeEthLast24Hours;
    data['ohlcv_last_24_hour'] = ohlcvLast24Hour;
    data['last_trade_at'] = lastTradeAt;
    return data;
  }
}
