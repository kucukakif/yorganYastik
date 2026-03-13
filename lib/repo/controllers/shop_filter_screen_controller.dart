import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopFilterScreenController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  final RxSet<int> selectedBrands = <int>{}.obs;

  void toggleBrand(int index) {
    if (selectedBrands.contains(index)) {
      selectedBrands.remove(index);
    } else {
      selectedBrands.add(index);
    }
    // Bazı durumlarda şart olabilir:
    // selectedBrands.refresh();
  }

  final selectedColors = <int>{}.obs; // Set daha mantıklı (duplicate olmaz)

  void toggleColor(int index) {
    if (selectedColors.contains(index)) {
      selectedColors.remove(index);
    } else {
      selectedColors.add(index);
    }
    selectedColors.refresh();
  }

  RxDouble sliderValue = 0.0.obs;
  final Rx<RangeValues> priceRange = const RangeValues(250, 2500).obs;
}
