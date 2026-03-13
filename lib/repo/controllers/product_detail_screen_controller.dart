import 'package:get/get.dart';
import 'package:yorgan_yastik/models/product_model.dart';

class ProductDetailScreenController extends GetxController {
  Rx<Product?> product = Rx<Product?>(null);

  @override
  void onInit() {
    product.value = Get.arguments;
    super.onInit();
  }
}
