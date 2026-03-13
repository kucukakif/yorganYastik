import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class DeliveryAddressScreenController extends GetxController {
  final step = 0.obs; // 0=Adres, 1=Ödeme, 2=Onay
  RxBool checkBoxValue = false.obs;
  final items = <int>[0, 1].obs;
  late final ConfettiController left;
  late final ConfettiController right;

  @override
  void onInit() {
    super.onInit();
    left = ConfettiController(duration: const Duration(milliseconds: 900));
    right = ConfettiController(duration: const Duration(milliseconds: 900));
  }

  void next() {
    if (step.value < 2) step.value++;
  }

  void back() {
    if (step.value > 0) step.value--;
  }

  var selectedIndex = 0.obs;
  final visibleCount = 1.obs;

  void select(int index) {
    selectedIndex.value = index;

    // seçilen item'ı başa al
    final selectedItem = items[index];
    items.removeAt(index);
    items.insert(0, selectedItem);

    // artık seçilen index 0 oldu
    selectedIndex.value = 0;
  }

  void showMore(int total) {
    visibleCount.value = total; // hepsini göster
  }

  void showLess() {
    visibleCount.value = 1; // tekrar 1’e düşür
  }

  void blast() {
    left.play();
    right.play();
  }

  @override
  void onClose() {
    left.dispose();
    right.dispose();
    super.onClose();
  }
}
