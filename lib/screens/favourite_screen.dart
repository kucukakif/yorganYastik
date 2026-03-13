import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/repo/controllers/bottom_navigator_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/shop_screen_controller.dart';
import 'package:yorgan_yastik/screens/bottom_navigator_screen.dart';
import 'package:yorgan_yastik/screens/product_details_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite';
  FavouriteScreen({super.key});

  final shopScreenController = Get.put(ShopScreenController());

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
            // Padding(
            //   padding: EdgeInsets.only(left: width * .03),
            //   child: GestureDetector(
            //     onTap: () => Get.back(),
            //     child: Padding(
            //       padding: EdgeInsets.only(right: width * .03),
            //       child: Image.asset(
            //         'assets/icons/arrow-left.png',
            //         width: 22,
            //         color: AppColors().iconColor,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(width: width * .04),
            SizedBox(width: width * .12),
            // TITLE AREA
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favoriler",
                    style: TextStyle(
                      color: AppColors().fontColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '6 ürün',
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * .04),
            child: InkWell(
              onTap: () {
                BottomNavigatorScreenController
                bottomNavigatorScreenController = Get.put(
                  BottomNavigatorScreenController(),
                );
                bottomNavigatorScreenController.currentIndex.value = 2;
                Get.toNamed(BottomNavigatorScreen.routeName);
              },
              child: SvgPicture.asset(
                'assets/icons/bottomBarIcons/basket-icon.svg',
                width: 20,
                height: 20,
                color: AppColors().iconColor,
              ),
            ),
          ),
          SizedBox(width: width * .01),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // yan yana 2 çocuk
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8, // kart oranı (isteğe göre değiştir)
        ),
        itemCount: shopScreenController.products.length,
        itemBuilder: (context, index) {
          String imageUrl = shopScreenController.products[index].imageUrl;
          String title = shopScreenController.products[index].title;
          double price = shopScreenController.products[index].price;
          return InkWell(
            onTap: () {
              Get.toNamed(
                ProductDetailsScreen.routeName,
                arguments: shopScreenController.products[index],
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().backGroungdColor,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(horizontal: width * .0025),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1.1, // görsel alanı oranı
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Container(
                              color: AppColors().borderColor,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    size: 36,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // favorite button
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.favorite,
                                color: AppColors().mainColor,
                                size: 19,
                              ),
                            ),
                          ),
                        ),

                        // badge
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors().mainColor,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.shopping_basket_outlined,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: width * .03,
                      left: width * .01,
                      top: height * .008,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors().fontColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          NumberFormat.currency(
                            locale: "tr_TR",
                            symbol: "₺",
                          ).format(price),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors().mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
