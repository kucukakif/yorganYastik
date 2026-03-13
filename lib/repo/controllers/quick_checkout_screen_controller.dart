import 'package:get/get.dart';
import 'package:yorgan_yastik/models/product_model.dart';

class QuickCheckoutScreenController extends GetxController {
  var selectedIndex = 0.obs;
  final visibleCount = 1.obs;
  final visibleCountForLocation = 1.obs;
  Rx<Product?> product = Rx<Product?>(null);

  @override
  void onInit() {
    product.value = Get.arguments;
    super.onInit();
  }

  void select(int index) {
    selectedIndex.value = index;
  }

  void showMore(int total) {
    visibleCount.value = total; // hepsini göster
  }

  void showLess() {
    visibleCount.value = 1; // tekrar 1’e düşür
  }

  void showMoreForDelivery(int total) {
    visibleCountForLocation.value = total; // hepsini göster
  }

  void showLessForDelivery() {
    visibleCountForLocation.value = 1; // tekrar 1’e düşür
  }
}
