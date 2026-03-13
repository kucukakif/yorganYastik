import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/repo/controllers/bottom_navigator_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/shop_screen_controller.dart';
import 'package:yorgan_yastik/screens/delivery_address_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class ShoppingCartScreen extends StatelessWidget {
  static const routeName = '/shoppingCart';
  ShoppingCartScreen({super.key});

  final shopScreenController = Get.put(ShopScreenController());
  BottomNavigatorScreenController bottomNavigatorScreenController = Get.put(
    BottomNavigatorScreenController(),
  );

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
        // leading: Padding(
        //   padding: EdgeInsets.only(left: width * .04),
        //   child: InkWell(
        //     onTap: () {
        //       if (bottomNavigatorScreenController.currentIndex.value != 2) {
        //         Get.back();
        //       } else {}
        //     },
        //     child: Icon(Icons.arrow_back_ios, size: 23),
        //   ),
        // ),
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            color: AppColors().fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * .06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "3",
                  style: TextStyle(
                    color: AppColors().mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Ürün",
                  style: TextStyle(
                    color: AppColors().mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 1) Scroll eden içerik
          ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: width * .04,
              vertical: height * .02,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ShoppingCartItem(
                imageUrl: shopScreenController.products[index].imageUrl,
                title: shopScreenController.products[index].title,
                price: shopScreenController.products[index].price,
                attributeValues:
                    shopScreenController.products[index].attributeValues,
              );
            },
            itemCount: shopScreenController.products.length,
          ),

          // 2) Altta sabit checkout kartı
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // bottom nav yüksekliği (genelde 70-90 arası)
            child: _checkoutSection(context, shopScreenController),
          ),
        ],
      ),
    );
  }

  Widget _checkoutSection(
    BuildContext context,
    ShopScreenController shopScreenController,
  ) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * .015,
        horizontal: width * .04,
      ),
      decoration: BoxDecoration(
        color: AppColors().backGroungdColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        border: Border.all(width: 1, color: AppColors().borderColor),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ara Toplam",
                  style: TextStyle(
                    fontSize: 17,
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
                    fontSize: 18,
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
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: AppColors().subColor,
                  ),
                ),
                Text(
                  "Ücretsiz",
                  style: TextStyle(fontSize: 18, color: Colors.green),
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
            SizedBox(height: height * .01),
            Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
            SizedBox(height: height * .01),
            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Toplam",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Text(
                  NumberFormat.currency(
                    locale: "tr_TR",
                    symbol: "₺",
                  ).format(2190),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors().merchantColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * .01),

            // Button
            SizedBox(
              width: double.infinity,
              height: height * .07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors().mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(DeliveryAddressScreen.routeName);
                },
                child: Text(
                  "Ödeme Yap →",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "GÜVENLİ ÖDEME",
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 11,
                color: AppColors().textFieldTitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.attributeValues,
  });

  final String imageUrl;
  final String title;
  final double price;
  final List<String> attributeValues;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
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
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: width * .03),

          // RIGHT SIDE
          Expanded(
            // 🔥 kritik nokta
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE + PRICE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      // 🔥 title alanı esnek
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors().fontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(width: 8),

                    Text(
                      NumberFormat.currency(
                        locale: "tr_TR",
                        symbol: "₺",
                      ).format(price),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors().mainColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * .01),

                // QUANTITY
                Row(
                  children: [
                    Container(
                      height: height * .038,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      margin: EdgeInsets.only(left: width * .04),
                      decoration: BoxDecoration(
                        color: AppColors().filterItemsColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.remove,
                            color: AppColors().mainColor,
                            size: 22,
                          ),
                          SizedBox(width: width * .03),
                          Text(
                            "1",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                          SizedBox(width: width * .03),
                          Icon(
                            Icons.add,
                            color: AppColors().mainColor,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: width * .05),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red,
                            size: 21,
                          ),
                          Text(
                            "Sil",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
    );
  }
}
