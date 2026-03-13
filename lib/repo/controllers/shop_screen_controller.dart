import 'package:confetti/confetti.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';
import 'package:yorgan_yastik/models/product_model.dart';

class ShopScreenController extends GetxController {
  final isLoading = false.obs;
  final error = ''.obs;
  var selectedCategoryIndex = 0.obs;
  RxDouble sliderValue = 1500.0.obs;
  late final ConfettiController left;
  late final ConfettiController right;

  final products = <Product>[].obs;
  final firstFour = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProductsFromXml();
    left = ConfettiController(duration: const Duration(milliseconds: 900));
    right = ConfettiController(duration: const Duration(milliseconds: 900));
  }

  Future<void> loadProductsFromXml() async {
    try {
      isLoading.value = true;
      error.value = '';

      final xmlString = await rootBundle.loadString(
        'assets/data/yorganyastik.xml',
      );
      final doc = XmlDocument.parse(xmlString);

      String textOf(XmlElement item, String tag) =>
          item.getElement(tag)?.innerText.trim() ?? '';

      final list = doc.findAllElements('item').map((item) {
        final title = textOf(item, 'post_title');
        final attrName = textOf(item, 'product_attribute_name1');
        final attrValueRaw = textOf(item, 'product_attribute_value1');

        final featured = textOf(item, 'featured_image');
        final thumb = textOf(item, 'thumbnail_id');
        final imageUrl = featured.isNotEmpty ? featured : thumb;

        final stockStatus = textOf(item, 'stock_status');
        final price = double.tryParse(textOf(item, 'price')) ?? 0.0;
        final taxStatus = int.tryParse(textOf(item, 'tax_status')) ?? 0;
        final productCategory = textOf(item, 'product_category');

        final attributeValues = attrValueRaw.isEmpty
            ? <String>[]
            : attrValueRaw
                  .split(',')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList();

        return Product(
          title: title,
          attributeName: attrName,
          attributeValues: attributeValues,
          imageUrl: imageUrl,
          stockStatus: stockStatus,
          price: price,
          taxStatus: taxStatus,
          productCategory: productCategory,
        );
      }).toList();

      products.assignAll(list);
      for (int i = 0; i < products.length; i++) {
        if (i < 4) {
          firstFour.add(products[i]);
        }
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
