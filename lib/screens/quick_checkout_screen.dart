import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/repo/controllers/quick_checkout_screen_controller.dart';
import 'package:yorgan_yastik/repo/payingProcesses/api_client.dart';
import 'package:yorgan_yastik/repo/payingProcesses/paymentWebViewPage.dart';
import 'package:yorgan_yastik/screens/add_new_payment_method_screen.dart';
import 'package:yorgan_yastik/screens/edit_address_screen.dart';
import 'package:yorgan_yastik/screens/new_address_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class QuickCheckoutScreen extends StatelessWidget {
  static const routeName = '/quickCheckout';
  QuickCheckoutScreen({super.key});

  final couponController = TextEditingController();

  final quickCheckoutScreenController = Get.put(
    QuickCheckoutScreenController(),
  );

  final billingCarNumbers = ["••••4242", "PayPal"];
  final dateOrEmail = ["Skt 12/26", "alex.r@email.com"];
  final iconList = [
    Icon(Icons.payment, color: AppColors().mainColor, size: 28),
    Icon(Icons.paypal, color: Colors.blue, size: 28),
  ];

  // Future<void> payNow(BuildContext context) async {
  //   final api = PaymentApi();

  //   // Bunlar sende olacak
  //   final orderId = 'ORD123'; // backend'in ürettiği ideal
  //   final userId = 'USER_45';
  //   final amountKurus = 1090;

  //   try {
  //     final start = await api.startPayment(
  //       orderId: orderId,
  //       amountKurus: amountKurus,
  //       userId: userId,
  //     );

  //     final result = await Navigator.push<PaymentResult>(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => PaymentWebViewPage(
  //           iframeUrl: start.iframeUrl,
  //           orderId: start.orderId,
  //           api: api,
  //         ),
  //       ),
  //     );

  //     if (result is PaymentPaid) {
  //       // UI: başarı
  //       // Sipariş detayını yeniden çek (backend'den) — çünkü callback serverda işlenmiş olmalı
  //     } else if (result is PaymentFailed) {
  //       // UI: hata
  //     } else {
  //       // iptal/geri
  //     }
  //   } catch (e) {
  //     // startPayment hata
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().backGroungdColor,
      appBar: AppBar(
        backgroundColor: AppColors().backGroungdColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        titleSpacing: 0,
        title: Row(
          children: [
            // BACK BUTTON
            Padding(
              padding: EdgeInsets.only(left: width * .03),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.only(right: width * .03),
                  child: Icon(Icons.close),
                ),
              ),
            ),
            SizedBox(width: width * .04),
            // TITLE AREA
            Expanded(
              child: Text(
                "Hemen Al",
                style: TextStyle(
                  color: AppColors().fontColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(1),
        //   child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: ListView(
          padding: EdgeInsets.only(bottom: height * .18),
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
                vertical: height * .015,
              ),
              margin: EdgeInsets.symmetric(vertical: height * .01),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  Container(
                    width: width * .26,
                    height: height * .12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          quickCheckoutScreenController.product.value!.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: width * .03),

                  // RIGHT SIDE
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TITLE + PRICE
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              // 🔥 title alanı esnek
                              child: Text(
                                quickCheckoutScreenController
                                    .product
                                    .value!
                                    .title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors().fontColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            SizedBox(width: 8),
                          ],
                        ),

                        SizedBox(height: height * .035),

                        // QUANTITY
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: "tr_TR",
                                symbol: "₺",
                              ).format(
                                quickCheckoutScreenController
                                    .product
                                    .value!
                                    .price,
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors().mainColor,
                              ),
                            ),
                            Container(
                              height: height * .03,
                              padding: EdgeInsets.symmetric(
                                horizontal: width * .02,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors().textFieldFillColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Adet: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .01,
                vertical: height * .01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TESLİMAT ADRESİ",
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontSize: 17,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(EditAddressScreen.routeName);
                    },
                    child: Text(
                      "Düzenle",
                      style: TextStyle(
                        color: AppColors().mainColor,
                        fontSize: 15,
                        // letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: AppColors().backGroungdColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: AppColors().borderColor),
              ),
              padding: EdgeInsets.only(
                left: width * .05,
                top: height * .015,
                bottom: height * .015,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor:
                            AppColors().circleAvatarBackgroundColor,
                        child: Icon(
                          Icons.place,
                          color: AppColors().mainColor,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: width * .02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Home • Alex Rivera",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "123 Cloud Lane, Austin, TX 78701",
                            style: TextStyle(
                              color: AppColors().subColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(NewAddressScreen.routeName);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors().borderColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .01),
            // Obx(() {
            //   final total = 2;
            //   final isAllShown =
            //       quickCheckoutScreenController.visibleCountForLocation.value >= total;

            //   return TextButton(
            //     onPressed: () {
            //       if (isAllShown) {
            //         quickCheckoutScreenController.showLess();
            //       } else {
            //         quickCheckoutScreenController.showMore(total);
            //       }
            //     },
            //     child: Text(
            //       isAllShown ? "Daha az göster" : "Daha fazla göster",
            //       style: TextStyle(color: AppColors().merchantColor),
            //     ),
            //   );
            // }),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .01,
                vertical: height * .01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ÖDEME YÖNTEMİ",
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontSize: 17,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(AddNewPaymentMethodScreen.routeName);
                      Get.to(
                        () => PaymentScreen(
                          orderId:
                              "ORD-${DateTime.now().millisecondsSinceEpoch}",
                          amountKurus: 190, // 10.90 TL
                          userId: "USER_0",
                        ),
                      );
                    },
                    child: Text(
                      "Yeni Ekle",
                      style: TextStyle(
                        color: AppColors().mainColor,
                        fontSize: 15,
                        // letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Obx(() {
              final count = quickCheckoutScreenController.visibleCount.value;
              final total = 2;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    itemCount: count.clamp(0, total),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final isSelected =
                            quickCheckoutScreenController.selectedIndex.value ==
                            index;

                        return GestureDetector(
                          onTap: () =>
                              quickCheckoutScreenController.select(index),
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              color: AppColors().backGroungdColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: isSelected ? 2 : 1,
                                color: isSelected
                                    ? AppColors().mainColor
                                    : AppColors().borderColor,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: height * .005,
                            ),
                            padding: EdgeInsets.only(
                              left: width * .05,
                              top: height * .015,
                              bottom: height * .015,
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: width * .12,
                                      height: height * .05,
                                      decoration: BoxDecoration(
                                        color: AppColors()
                                            .circleAvatarBackgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: iconList[index],
                                    ),
                                    SizedBox(width: width * .02),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          billingCarNumbers[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          dateOrEmail[index],
                                          style: TextStyle(
                                            color: AppColors().subColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                // RADIO STYLE CHECK
                                Container(
                                  width: width * .06,
                                  height: height * .04,
                                  margin: EdgeInsets.only(right: width * .04),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors().mainColor
                                          : Colors.grey.shade400,
                                      width: 2,
                                    ),
                                    color: isSelected
                                        ? AppColors().mainColor
                                        : Colors.transparent,
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              );
            }),

            Obx(() {
              final total = 2;
              final isAllShown =
                  quickCheckoutScreenController.visibleCount.value >= total;

              return TextButton(
                onPressed: () {
                  if (isAllShown) {
                    quickCheckoutScreenController.showLess();
                  } else {
                    quickCheckoutScreenController.showMore(total);
                  }
                },
                child: Text(
                  isAllShown ? "Daha az göster" : "Daha fazla göster",
                  style: TextStyle(color: AppColors().merchantColor),
                ),
              );
            }),
            Padding(
              padding: EdgeInsets.only(left: width * .01),
              child: Text(
                "KUPON",
                style: TextStyle(
                  color: AppColors().textFieldTitleColor,
                  fontSize: 17,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * .04,
                vertical: height * .01,
              ),
              margin: EdgeInsets.only(
                top: height * .01,
                right: width * .01,
                left: width * .01,
              ),
              height: height * .083,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors().backGroungdColor,
                border: Border.all(width: 1, color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    width: width * .33,
                    // height: height * .06,
                    decoration: BoxDecoration(
                      color: AppColors().mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: height * .001),
                    alignment: Alignment.center,
                    child: Text(
                      "Kupon Kullan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    child: TextFormField(
                      controller: couponController,
                      onTapUpOutside: (e) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors().textFieldBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors().textFieldBorderColor,
                          ),
                        ),
                        fillColor: AppColors().textFieldFillColor,
                        hintText: "Kupon Kodu",
                        // labelText: text,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors().subColor,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors().textFieldLabelColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .02),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * .04,
                vertical: height * .02,
              ),
              decoration: BoxDecoration(
                color: AppColors().filterItemsColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ara Toplam",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors().subColor,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: "tr_TR",
                          symbol: "₺",
                        ).format(2190),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Shipping
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kargo",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors().subColor,
                        ),
                      ),
                      Text(
                        "Ücretsiz",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Text(
                      //           "Ücretsiz kargoya son ",
                      //           style: const TextStyle(
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //         Text(
                      //           NumberFormat.currency(
                      //             locale: "tr_TR",
                      //             symbol: "₺",
                      //           ).format(1500 - 1490),
                      //           style: TextStyle(
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.w600,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(height: height * .01),
                      //     SliderTheme(
                      //       data: SliderTheme.of(context).copyWith(
                      //         thumbShape:
                      //             SliderComponentShape.noThumb, // 👈 thumb yok
                      //         activeTrackColor: AppColors().merchantColor,
                      //         inactiveTrackColor: Colors.black,
                      //         overlayShape: SliderComponentShape
                      //             .noOverlay, // basınca çıkan halka da yok
                      //       ),
                      //       child: Slider(
                      //         value: 1490,
                      //         min: 0,
                      //         max: 1500,
                      //         divisions: 10,
                      //         onChanged: (value) {},
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors().borderColor,
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Toplam",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: "tr_TR",
                              symbol: "₺",
                            ).format(2190),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "(219₺ KDV dahil)",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _checkoutSection(context),
    );
  }

  Widget _checkoutSection(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height * .01,
            horizontal: width * .04,
          ),
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width,
                height: height * .07,
                decoration: BoxDecoration(
                  color: AppColors().mainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: height * .005,
                  horizontal: width * .01,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Siparişi Onayla",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
