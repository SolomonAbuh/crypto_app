import 'dart:convert';
import 'package:crypto_app/app/data/model/coin_data_model.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import '../model/coin_data_details_model.dart';

class ApiService {
  final baseUrl = 'https://data.messari.io/api/v2/';
  Future<http.Response> getRequest() async {
    print('************Ogorima*********** don start 000');
    final response = await http.get(Uri.parse(
        'https://data.messari.io/api/v2/assets?fields=id,slug,symbol,metrics/market_data'));
    print('****');
    final responseNew = jsonDecode(response.body);
    print(CoinData.fromJson(responseNew as Map<String, dynamic>).data);
    return response;
    // return CoinData.fromJson(response.body as Map<String, dynamic>).data!;
  }
}
