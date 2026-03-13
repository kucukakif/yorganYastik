import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/repo/controllers/bottom_navigator_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/product_detail_screen_controller.dart';
import 'package:yorgan_yastik/screens/bottom_navigator_screen.dart';
import 'package:yorgan_yastik/screens/quick_checkout_screen.dart';
import 'package:yorgan_yastik/screens/reviews_scren.dart';
import 'package:yorgan_yastik/screens/widgets/categoryProductCard.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/productDetails';
  ProductDetailsScreen({super.key});

  int qty = 1;
  ProductDetailScreenController productDetailScreenController = Get.put(
    ProductDetailScreenController(),
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
        leadingWidth: width * .12,
        leading: Padding(
          padding: EdgeInsets.only(left: width * .02),
          child: CircleAvatar(
            radius: width * .05,
            backgroundColor: AppColors().textFieldBorderColor,
            child: InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 22),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Ürün Detayları",
          style: TextStyle(
            color: AppColors().fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * .06),
            child: InkWell(
              onTap: () {
                BottomNavigatorScreenController
                bottomNavigatorScreenController = Get.put(
                  BottomNavigatorScreenController(),
                );
                bottomNavigatorScreenController.currentIndex.value = 2;
                Get.toNamed(BottomNavigatorScreen.routeName);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors().textFieldBorderColor,
                child: Badge(
                  label: const Text("2", style: TextStyle(color: Colors.white)),
                  backgroundColor: AppColors().merchantColor,
                  child: Icon(Icons.shopping_bag_outlined, size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors().backGroungdColor,
        margin: EdgeInsets.symmetric(vertical: height * .01),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // IMAGE AREA
            AspectRatio(
              aspectRatio: 1.1, // görsel alanı oranı
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: AppColors().borderColor,
                      child: Image.network(
                        productDetailScreenController.product.value!.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.broken_image_outlined, size: 36),
                        ),
                      ),
                    ),
                  ),

                  // favorite button
                  Positioned(
                    bottom: 18,
                    right: 10,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors().mainColor,
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
                top: height * .02,
                right: width * .05,
                left: width * .05,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PREMİUM KOLEKSİYON",
                    style: TextStyle(
                      color: AppColors().mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    children: [
                      // ...List.generate(4, (_) => const Star(full: true)),
                      Star(full: true),
                      // const SizedBox(width: 12),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' ${4.7.toStringAsFixed(1)}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black, // rating rengi
                              ),
                            ),
                            const TextSpan(
                              text: ' (3.897)',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8A98AD), // count rengi
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
            SizedBox(height: height * .01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * .01,
                horizontal: width * .05,
              ),
              child: Text(
                productDetailScreenController.product.value!.title,
                style: TextStyle(
                  color: AppColors().fontColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Row(
                children: [
                  Text(
                    NumberFormat.currency(locale: "tr_TR", symbol: "₺").format(
                      productDetailScreenController.product.value!.price,
                    ),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors().mainColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Renk/Desen Seçimi",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Renk Klavuzu",
                    style: TextStyle(
                      color: AppColors().mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .03,
                vertical: height * .02,
              ),
              child: Row(
                children: [
                  Container(
                    width: width * .29,
                    height: height * .07,
                    margin: EdgeInsets.symmetric(horizontal: width * .01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors().mainColor.withOpacity(0.1),
                      border: Border.all(
                        width: 1,
                        color: AppColors().mainColor,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Bahar Dalı",
                      style: TextStyle(
                        color: AppColors().mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .29,
                    height: height * .07,
                    margin: EdgeInsets.symmetric(horizontal: width * .01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors().backGroungdColor,
                      border: Border.all(
                        width: 1,
                        color: AppColors().borderColor,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Yaz Çiçeği",
                      style: TextStyle(
                        color: AppColors().textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .29,
                    height: height * .07,
                    margin: EdgeInsets.symmetric(horizontal: width * .01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors().backGroungdColor,
                      border: Border.all(
                        width: 1,
                        color: AppColors().borderColor,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Zig Zag",
                      style: TextStyle(
                        color: AppColors().textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              // child: DefaultTabController(
              //   length: 3,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Container(
              //         color: AppColors().backGroungdColor,
              //         child: TabBar(
              //           indicatorColor: AppColors().mainColor,
              //           indicatorWeight: 3,
              //           indicatorSize: TabBarIndicatorSize.tab,
              //           labelColor: AppColors().mainColor,
              //           unselectedLabelColor: AppColors().subColor,
              //           tabs: const [
              //             Tab(text: "Features"),
              //             Tab(text: "Care Instructions"),
              //             Tab(text: "Reviews"),
              //           ],
              //         ),
              //       ),
              //       // Container(height: 1, color: Colors.grey.shade300),

              //       // ✅ Expanded yok! Yükseklik veriyoruz:
              //       SizedBox(
              //         height: 400, // ihtiyacına göre ayarla
              //         child: TabBarView(
              //           children: [
              //             _featuresTab(context),
              //             _simpleCenter("Care Instructions Content"),
              //             _simpleCenter("Reviews Content"),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              child: _featuresTab(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          color: AppColors().backGroungdColor,
          padding: const EdgeInsets.fromLTRB(10, 12, 10, 14),
          child: Row(
            children: [
              _QtyStepper(
                value: qty,
                onMinus: () => qty = (qty > 1) ? qty - 1 : 1,
                onPlus: () => qty += 1,
              ),
              SizedBox(width: width * .02),
              Expanded(
                child: SizedBox(
                  height: height * .055,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(
                        () => QuickCheckoutScreen(),
                        arguments: productDetailScreenController.product.value!,
                        transition: Transition.downToUp,
                        // duration: const Duration(milliseconds: 300),
                      );
                    },
                    label: const Text(
                      "Hemen Al",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppColors().mainColor,
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * .02),
              Expanded(
                child: SizedBox(
                  height: height * .055,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text(
                      "Sepete Ekle",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppColors().mainColor,
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featuresTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        0,
        18,
        0,
        120,
      ), // bottom bar için boşluk
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2x2 feature cards
          Row(
            children: [
              Expanded(
                child: _FeatureCard(
                  icon: Icons.air,
                  title: "FILL POWER",
                  value: "800+ High Loft",
                  accent: AppColors().mainColor,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _FeatureCard(
                  icon: Icons.local_florist_outlined,
                  title: "MATERIAL",
                  value: "Hypoallergenic",
                  accent: AppColors().mainColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _FeatureCard(
                  icon: Icons.grid_view_rounded,
                  title: "STITCHING",
                  value: "Baffle Box",
                  accent: AppColors().mainColor,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _FeatureCard(
                  icon: Icons.layers_outlined,
                  title: "CASING",
                  value: "100% Cotton",
                  accent: AppColors().mainColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // description
          Text(
            "Experience unparalleled luxury with our ethically sourced Siberian Goose Down Quilt. Designed for year-round comfort, the baffle box construction ensures the down stays evenly distributed for consistent warmth and breathability.",
            style: TextStyle(
              color: const Color(0xFF495466),
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 26),

          // Reviews header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Yorumlar (124)",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(ReviewsScren.routeName);
                },
                child: Text(
                  "Hepsini Gör",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors().mainColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // One review item
          _ReviewTile(
            initials: "EM",
            name: "Emma M.",
            daysAgo: "2 days ago",
            quote:
                "\"The softest quilt I've ever owned. Like sleeping in a cloud!\"",
          ),

          Divider(color: Colors.black.withOpacity(0.06)),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.accent,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: accent, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors().textFieldTitleColor,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({
    required this.initials,
    required this.name,
    required this.daysAgo,
    required this.quote,
  });

  final String initials;
  final String name;
  final String daysAgo;
  final String quote;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xFFE8EEF6),
          child: Text(
            initials,
            style: const TextStyle(
              color: Color(0xFF1D2A3B),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101828),
                      ),
                    ),
                  ),
                  Text(
                    daysAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8A98AD),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Icon(Icons.star, size: 14, color: Color(0xFFF2B233)),
                  Icon(Icons.star, size: 14, color: Color(0xFFF2B233)),
                  Icon(Icons.star, size: 14, color: Color(0xFFF2B233)),
                  Icon(Icons.star, size: 14, color: Color(0xFFF2B233)),
                  Icon(Icons.star, size: 14, color: Color(0xFFF2B233)),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                quote,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.45,
                  color: Color(0xFF495466),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QtyStepper extends StatelessWidget {
  const _QtyStepper({
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .055,
      width: width * .25,
      decoration: BoxDecoration(
        color: AppColors().textFieldFillColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors().borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: onMinus,
              icon: const Icon(Icons.remove, size: 20),
            ),
          ),
          Text(
            "$value",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: IconButton(
              onPressed: onPlus,
              icon: const Icon(Icons.add, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
