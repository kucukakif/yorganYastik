import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/repo/controllers/shop_filter_screen_controller.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class ShopFilterScreen extends StatelessWidget {
  static const routeName = '/shopFilterScreen';
  ShopFilterScreen({super.key});

  ShopFilterScreenController shopFilterScreenController = Get.put(
    ShopFilterScreenController(),
  );

  final sortingNamesList = [
    "Popülerlik",
    "En Yeniler",
    "Fiyat: Düşükten Yükseğe",
    "Fiyat: Yüksekten Düşüğe",
  ];

  final brandsNamesList = ['Luna Bueno', 'Oso Blanco', 'Stoffa'];

  final colorsNamesList = ['Mavi', 'Bordo', 'Haki', 'Yeşil', 'Krem'];
  final colorsList = [
    Colors.blue,
    Colors.red.shade900,
    Colors.green.shade900,
    Colors.green,
    Colors.brown.shade200,
  ];

  String _formatTL(double v) {
    // 2500 -> 2.500
    final s = v.round().toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final idxFromEnd = s.length - i;
      buf.write(s[i]);
      if (idxFromEnd > 1 && idxFromEnd % 3 == 1) buf.write('.');
    }
    return "₺$buf";
  }

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
            Padding(
              padding: EdgeInsets.only(left: width * .04),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close, size: 23),
              ),
            ),
            SizedBox(width: width * .04),
            Text(
              "Filtrele ve Sıralama",
              style: TextStyle(
                color: AppColors().fontColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * .04),
            child: Text(
              "Temizle",
              style: TextStyle(
                color: AppColors().mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                        vertical: height * .02,
                      ),
                      child: Text(
                        'SIRALAMA',
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .05),
                      child: SizedBox(
                        height: height * .25,
                        child: Obx(() {
                          final selected =
                              shopFilterScreenController.selectedIndex.value;

                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: sortingNamesList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  shopFilterScreenController
                                          .selectedIndex
                                          .value =
                                      index;
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * .002,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        sortingNamesList[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      /// ✅ Radio
                                      Radio<int>(
                                        value: index,
                                        groupValue: selected,
                                        onChanged: (value) {
                                          shopFilterScreenController
                                                  .selectedIndex
                                                  .value =
                                              value!;
                                        },
                                        activeColor: AppColors().merchantColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    Divider(color: Colors.grey.shade200),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                        vertical: height * .02,
                      ),
                      child: Text(
                        'MARKA',
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .05),
                      child: SizedBox(
                        height: height * .19,
                        child: Obx(() {
                          // ✅ RxSet okuması garanti olsun diye length'i “okut”
                          final selectedSet =
                              shopFilterScreenController.selectedBrands;
                          final _ = selectedSet
                              .length; // <- bunu koyunca Obx kesin Rx okur

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: brandsNamesList.length,
                            itemBuilder: (context, index) {
                              final isSelected = selectedSet.contains(index);

                              return InkWell(
                                onTap: () => shopFilterScreenController
                                    .toggleBrand(index),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * .002,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        brandsNamesList[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Checkbox(
                                        value: isSelected,
                                        onChanged: (_) =>
                                            shopFilterScreenController
                                                .toggleBrand(index),
                                        activeColor: AppColors().merchantColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    Divider(color: Colors.grey.shade200),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                        vertical: height * .02,
                      ),
                      child: Text(
                        'RENK',
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .05),
                      child: SizedBox(
                        height: height * .26,
                        child: Obx(() {
                          // ÖNEMLİ: RxSet'in .value'sunu okuyoruz -> Obx gerçek Rx okumuş oluyor
                          final selectedSet = shopFilterScreenController
                              .selectedColors
                              .toSet();

                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: colorsNamesList.length, // ✅ düzeltildi
                            itemBuilder: (context, index) {
                              final isSelected = selectedSet.contains(index);

                              return InkWell(
                                onTap: () => shopFilterScreenController
                                    .toggleColor(index),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * .006,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 18,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              color: colorsList[index],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          SizedBox(width: width * .03),
                                          Text(
                                            colorsNamesList[index],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Checkbox(
                                        value: isSelected,
                                        onChanged: (_) =>
                                            shopFilterScreenController
                                                .toggleColor(index),
                                        activeColor: AppColors().merchantColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: height * .04),
                    // Header row
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                        vertical: height * .02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FİYAT',
                            style: TextStyle(
                              color: AppColors().textFieldTitleColor,
                              fontSize: 18,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            "${_formatTL(shopFilterScreenController.priceRange.value.start)} - ${_formatTL(shopFilterScreenController.priceRange.value.end)}",
                            style: TextStyle(
                              color: AppColors().mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Slider
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .03),
                      child: Obx(() {
                        return _PrettyRangeSlider(
                          values: shopFilterScreenController.priceRange.value,
                          min: 0,
                          max: 5000,
                          onChanged: (v) {
                            shopFilterScreenController.priceRange.value = v;
                          },
                        );
                      }),
                    ),

                    SizedBox(height: height * .02),

                    // MIN / MAX cards
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .05),
                      child: Obx(() {
                        return Row(
                          children: [
                            _MinMaxCard(
                              title: "MIN",
                              value: _formatTL(
                                shopFilterScreenController
                                    .priceRange
                                    .value
                                    .start,
                              ),
                            ),
                            SizedBox(width: width * .04),
                            _MinMaxCard(
                              title: "MAX",
                              value: _formatTL(
                                shopFilterScreenController.priceRange.value.end,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),

                    SizedBox(height: height * .02),

                    // Divider line like screenshot
                    // const Divider(
                    //   height: 1,
                    //   thickness: 1,
                    //   color: Color(0xFFE8EEF6),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
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
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
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
                    "Sonuçları Göster",
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
      ),
    );
  }
}

class _MinMaxCard extends StatelessWidget {
  const _MinMaxCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        height: height * .08,
        width: width,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          horizontal: width * .05,
          vertical: height * .01,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF7FAFF),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE7EFF8), width: 1.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// RangeSlider görünümünü ekrandaki gibi yapan tema
class _PrettyRangeSlider extends StatelessWidget {
  const _PrettyRangeSlider({
    required this.values,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final RangeValues values;
  final double min;
  final double max;
  final ValueChanged<RangeValues> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 3,
        activeTrackColor: const Color(0xFF1677FF),
        inactiveTrackColor: const Color(0xFFE5ECF5),
        rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
        thumbColor: const Color(0xFF1677FF),
        overlayColor: const Color(0xFF1677FF).withOpacity(.12),
        // Thumb’a gölge efekti
        rangeThumbShape: const _ShadowRangeThumbShape(radius: 8, elevation: 10),
        rangeTickMarkShape: const RoundRangeSliderTickMarkShape(
          tickMarkRadius: 0,
        ),
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: 100,
        onChanged: onChanged,
      ),
    );
  }
}

/// Thumb gölgeli olsun diye custom shape (Flutter yeni imza ile)
class _ShadowRangeThumbShape extends RangeSliderThumbShape {
  const _ShadowRangeThumbShape({required this.radius, required this.elevation});

  final double radius;
  final double elevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(radius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop = false,
    bool isPressed = false,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
  }) {
    final canvas = context.canvas;

    // Shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(center.translate(0, 6), radius, shadowPaint);

    // White ring
    final ringPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius + 6, ringPaint);

    // Blue thumb
    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor ?? AppColors().mainColor;
    canvas.drawCircle(center, radius, fillPaint);
  }
}
