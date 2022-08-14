import 'dart:convert';

import 'package:crypto_app/app/data/model/coin_data_details_model.dart';
import 'package:crypto_app/app/data/model/coin_data_model.dart';
import 'package:crypto_app/app/data/network/api_client.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxList<Data> coinDataList = <Data>[].obs;
  RxBool dataLoading = false.obs;

  RxList<Data> topFiveCoins() {
    var temp = <Data>[].obs;
    for (int i = 0; i < 5; i++) {
      temp.add(coinDataList[i]);
    }
    return temp;
  }

  ApiService api = ApiService();

  void getCoinList() async {
    dataLoading.value = true;
    final response = await api.getRequest();
    switch (response.statusCode) {
      case 200:
        {
          coinDataList.value =
              CoinData.fromJson(jsonDecode(response.body)).data!;
          dataLoading.value = false;
        }
        break;

      default:
        Get.snackbar('Error fetching data', '');
    }
    dataLoading.value = false;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    getCoinList();
    print('### get coin list has been called');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
