import 'package:crypto_app/app/data/network/api_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return Scaffold(
      backgroundColor: const Color(0xff293656),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: Get.width * 0.06,
            right: Get.width * 0.06,
            top: Get.height * 0.04,
          ),
          child: Obx(
            () => (controller.dataLoading.value &&
                    controller.coinDataList.isEmpty)
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    color: Color(0xff293656),
                    child: Center(child: CircularProgressIndicator()))
                : SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xff3B4C78),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: Get.height * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/${controller.coinDataList[0].symbol}.png',
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  controller.coinDataList[0].slug!.capitalize!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                              'USD ${oCcy.format(num.parse(controller.coinDataList[0].metrics!.marketData!.priceUsd!))}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Send/receive',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () {
                                    var hm = controller.coinDataList.length;
                                    print(hm);
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xff619FF2),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Top 5 coins',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.topFiveCoins().length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xff3B4C78),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/${controller.coinDataList[index].symbol}.png',
                                        height: 45,
                                        width: 45,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .coinDataList[index].symbol!,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.coinDataList[index]
                                                  .slug!.capitalize!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        oCcy.format(num.parse(controller
                                            .coinDataList[index]
                                            .metrics!
                                            .marketData!
                                            .priceUsd!)),
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      controller
                                                  .coinDataList[index]
                                                  .metrics!
                                                  .marketData!
                                                  .percentChangeBtcLast24Hours! <
                                              0
                                          ? Icon(
                                              Icons.arrow_downward,
                                              color: Colors.redAccent,
                                            )
                                          : Icon(
                                              Icons.arrow_upward,
                                              color: Colors.green,
                                            ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller
                                            .coinDataList[index]
                                            .metrics!
                                            .marketData!
                                            .percentChangeBtcLast24Hours!
                                            .toStringAsFixed(5),
                                        style: TextStyle(
                                            color: controller
                                                        .coinDataList[index]
                                                        .metrics!
                                                        .marketData!
                                                        .percentChangeBtcLast24Hours! <
                                                    0
                                                ? Colors.redAccent
                                                : Colors.green),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'All coins',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                tileColor: Color(0xff3B4C78),
                                leading: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Image.asset(
                                    'assets/icons/${controller.coinDataList[index].symbol}.png',
                                    height: 45,
                                    width: 45,
                                  ),
                                ),
                                subtitle: Text(
                                  controller
                                      .coinDataList[index].slug!.capitalize!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                title: Text(
                                  controller.coinDataList[index].symbol!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    controller
                                                .coinDataList[index]
                                                .metrics!
                                                .marketData!
                                                .percentChangeBtcLast24Hours! <
                                            0
                                        ? Icon(
                                            Icons.arrow_downward,
                                            color: Colors.redAccent,
                                          )
                                        : Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      controller
                                          .coinDataList[index]
                                          .metrics!
                                          .marketData!
                                          .percentChangeBtcLast24Hours!
                                          .toStringAsFixed(5),
                                      style: TextStyle(
                                          color: controller
                                                      .coinDataList[index]
                                                      .metrics!
                                                      .marketData!
                                                      .percentChangeBtcLast24Hours! <
                                                  0
                                              ? Colors.redAccent
                                              : Colors.green),
                                    )
                                  ],
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: controller.coinDataList.length)
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}
