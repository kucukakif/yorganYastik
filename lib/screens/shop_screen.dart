import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/repo/controllers/category_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/shop_screen_controller.dart';
import 'package:yorgan_yastik/screens/category_screen.dart';
import 'package:yorgan_yastik/screens/product_details_screen.dart';
import 'package:yorgan_yastik/screens/shop_filter_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = '/shop';
  ShopScreen({super.key});

  final shopScreenController = Get.put(ShopScreenController());
  final filterController = TextEditingController();

  final imageNameList = [
    'bed.svg',
    'towel.svg',
    'table.svg',
    'circle.svg',
    'box.svg',
  ];

  final categoryNameList = [
    'Yatak Odası',
    'Banyo Grubu',
    'Sofra Tekstili',
    'Dekorasyon',
    'Çeyiz Setleri',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().backGroungdColor,
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: ListView(
              children: [
                SizedBox(
                  width: width.toDouble(),
                  height: height * .07,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .005),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: width * .03),
                            child: TextField(
                              controller: filterController,
                              onTapUpOutside: (e) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: AppColors().textFieldTitleColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: AppColors().textFieldTitleColor,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Yorgan, yastık arayın...",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: AppColors().textFieldTitleColor,
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: AppColors().textFieldTitleColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ShopFilterScreen(),
                              transition: Transition.downToUp,
                            );
                          },
                          child: Container(
                            width: width * .13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: AppColors().textFieldTitleColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/icons/filter-icon.png',
                              width: 28,
                              height: 28,
                              color: AppColors().mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: height * .26,
                      margin: EdgeInsets.symmetric(vertical: height * .01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(
                            shopScreenController.products.first.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Gradient overlay (isteğe bağlı ama tavsiye edilir)
                    Container(
                      width: width,
                      height: height * .26,
                      margin: EdgeInsets.symmetric(vertical: height * .01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    // Yazı
                    Positioned(
                      left: width * .08,
                      top: height * .04,
                      child: Container(
                        width: width * .25,
                        height: height * .03,
                        decoration: BoxDecoration(
                          color: AppColors().mainColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Kış İndirimi",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * .08,
                      top: height * .038,
                      child: Container(
                        width: width * .25,
                        height: height * .03,
                        decoration: BoxDecoration(
                          color: AppColors().mainColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Kış İndirimi",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * .08,
                      top: height * .075,
                      child: Text(
                        "Daha İyi Uyku",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * .08,
                      top: height * .11,
                      child: Text(
                        "%40'a varan indirimlerle\nkonforunuzu yükseltin",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * .08,
                      top: height * .19,
                      child: Container(
                        width: width * .3,
                        height: height * .05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Şimdi Al",
                          style: TextStyle(
                            color: AppColors().mainColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * .02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kategoriler",
                        style: TextStyle(
                          color: AppColors().fontColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Text(
                      //   "Hepsini Gör",
                      //   style: TextStyle(
                      //     color: AppColors().mainColor,
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .11,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => CategoryScreen(),
                                  arguments: [categoryNameList[index]],
                                  transition: Transition.cupertino,
                                );
                                final categoryScreenController = Get.put(
                                  CategoryScreenController(),
                                );
                                categoryScreenController.categoryName.value =
                                    categoryNameList[index];
                              },
                              child: CircleAvatar(
                                radius: 33,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/icons/shopScreenIcons/${imageNameList[index]}',
                                  width: 33,
                                  height: 33,
                                  color: AppColors().subColor,
                                ),
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Get.toNamed(
                            //       CategoryScreen.routeName,
                            //       arguments: [categoryNameList[index]],
                            //     );
                            //     final categoryScreenController = Get.put(
                            //       CategoryScreenController(),
                            //     );
                            //     categoryScreenController.categoryName.value =
                            //         categoryNameList[index];
                            //   },
                            //   child: CircleAvatar(
                            //     radius: 33,
                            //     backgroundColor: AppColors().mainColor
                            //         .withOpacity(0.8),
                            //     child: SvgPicture.asset(
                            //       'assets/icons/shopScreenIcons/${imageNameList[index]}',
                            //       width: 33,
                            //       height: 33,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: height * .002),
                            Text(
                              categoryNameList[index],
                              style: TextStyle(
                                color: AppColors().subColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * .02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yeni Trendler",
                        style: TextStyle(
                          color: AppColors().fontColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: width * .27,
                        height: height * .03,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors().mainColor.withOpacity(0.2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Hatfanın Enleri",
                          style: TextStyle(
                            color: AppColors().mainColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      shopScreenController.firstFour.length, // ürün sayısı
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 👈 yan yana 2
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.58, // kart oranı (isteğe göre ayarla)
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => ProductDetailsScreen(),
                          arguments: shopScreenController.products[index],
                          transition: Transition.cupertino,
                        );
                      },
                      child: ProductCard(
                        imageUrl:
                            shopScreenController.firstFour[index].imageUrl,
                        rating: 4.7,
                        ratingCount: 856,
                        title: shopScreenController.firstFour[index].title,
                        subtitle: shopScreenController
                            .products[index]
                            .attributeValues
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        priceText: shopScreenController.firstFour[index].price
                            .toInt(),
                        onFavorite: () {},
                        onAddToCart: () {},
                      ),
                    );
                  },
                ),
                SizedBox(height: height * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
    required this.title,
    required this.subtitle,
    required this.priceText,
    this.onFavorite,
    this.onAddToCart,
  });

  final String imageUrl;
  final double rating;
  final int ratingCount;
  final String title;
  final String subtitle;
  final int priceText;
  final VoidCallback? onFavorite;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final cardH = height * 0.35; // örnek, kartın toplam yüksekliği
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F2EF), // kart zemin (krem)
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE AREA
          SizedBox(
            height: cardH * (6 / 11),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: const Color(0xFFEDE7E3),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image_outlined, size: 36),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: InkWell(
                      onTap: onFavorite,
                      child: Icon(
                        Icons.favorite_border,
                        color: Color(0xFFE45B6B), // pembe-kırmızı kalp
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CONTENT AREA
          SizedBox(
            height: cardH * (5 / 11),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .02,
                vertical: height * .01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFF3C244),
                        size: 12,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${rating.toStringAsFixed(1)}($ratingCount)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .01),

                  // title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors().fontColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * .005),

                  // subtitle
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors().textColor,
                      fontSize: 12,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                  // SizedBox(height: height * .01),
                  const Spacer(),
                  // price + cart btn
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: "tr_TR",
                          symbol: "₺",
                        ).format(priceText),
                        style: TextStyle(
                          color: AppColors().mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: onAddToCart,
                        child: Container(
                          width: width * .08,
                          height: height * .035,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors().mainColor,
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
