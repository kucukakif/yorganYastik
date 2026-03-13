import 'package:get/get.dart';
import 'package:yorgan_yastik/models/product_model.dart';
import 'package:yorgan_yastik/repo/controllers/shop_screen_controller.dart';

class CategoryScreenController extends GetxController {
  final filtered = <Product>[].obs;
  RxString categoryName = "".obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    categoryName.value = args[0];

    // Sayfa açılır açılmaz çalışacak fonksiyon:
    filterByCategory(categoryName.value);
  }

  void filterByCategory(String category) {
    final shopScreenController = Get.put(ShopScreenController());
    filtered.value = shopScreenController.products
        .where((p) => p.productCategory.toLowerCase() == category.toLowerCase())
        .toList();
  }
}
