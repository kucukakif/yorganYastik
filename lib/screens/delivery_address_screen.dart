import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/models/product_model.dart';
import 'package:yorgan_yastik/repo/controllers/delivery_address_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/shop_screen_controller.dart';
import 'package:yorgan_yastik/screens/add_new_payment_method_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';
import 'package:yorgan_yastik/widgets/textFormFieldWidget.dart';

class DeliveryAddressScreen extends StatelessWidget {
  static const routeName = '/deliveryAddress';
  DeliveryAddressScreen({super.key});

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final districtController = TextEditingController();
  final streetController = TextEditingController();
  final deliveryScreenController = Get.find<DeliveryAddressScreenController>();

  PreferredSize buildCheckoutStepBar(BuildContext context) {
    final c = Get.find<DeliveryAddressScreenController>();

    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .045),
      child: Container(
        color: AppColors().backGroungdColor,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
        child: Obx(() {
          final i = c.step.value;
          const labels = ["Adres", "Ödeme", "Onay"];

          return Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ tıklamayı kapat
                  AbsorbPointer(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: Container(
                        height: 8,
                        color: Colors.grey.shade300,
                        child: Row(
                          children: List.generate(3, (index) {
                            final filled = index <= i;
                            return Expanded(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOut,
                                color: filled
                                    ? AppColors().mainColor
                                    : Colors.grey.shade300,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),

                  // a234p12p
                  const SizedBox(height: 10),

                  // Textler de tıklanmasın
                  AbsorbPointer(
                    child: Row(
                      children: List.generate(3, (index) {
                        // final active = index == i;
                        // final filled = index <= i;
                        return Expanded(
                          child: Text(
                            labels[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: index <= i
                                  ? AppColors()
                                        .mainColor // ✅ geçmiş ve aktif aynı renk
                                  : Colors.grey.shade600,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              // ✅ Sol kenar konfeti
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: deliveryScreenController.left,
                  blastDirection: 0, // sağa doğru (radyan) 0 = sağ
                  emissionFrequency: 0.0, // play() anında patlasın
                  numberOfParticles: 30,
                  maxBlastForce: 18,
                  minBlastForce: 10,
                  gravity: 0.5,
                  shouldLoop: false,
                ),
              ),

              // ✅ Sağ kenar konfeti
              Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  confettiController: deliveryScreenController.right,
                  blastDirection: 3.14159, // sola doğru (pi)
                  emissionFrequency: 0.0,
                  numberOfParticles: 30,
                  maxBlastForce: 18,
                  minBlastForce: 10,
                  gravity: 0.5,
                  shouldLoop: false,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  String _appBarTitle(int step) {
    switch (step) {
      case 0:
        return "Teslimat Adresi";
      case 1:
        return "Ödeme Yöntemi";
      case 2:
        return "Gözden Geçir";
      default:
        return "Checkout";
    }
  }

  Widget _bottomBar(int step, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // final deliveryScreenController = Get.find<DeliveryAddressScreenController>();
    switch (step) {
      case 0:
        return SafeArea(
          top: false,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Container(
              padding: EdgeInsets.only(
                top: height * .025,
                left: width * .04,
                right: width * .04,
              ),
              decoration: BoxDecoration(
                color: AppColors().backGroungdColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                border: Border(
                  left: BorderSide.none,
                  right: BorderSide.none,
                  bottom: BorderSide.none,
                  top: BorderSide(
                    width: 1,
                    color: AppColors().borderColor,
                  ), // zaten yok
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      deliveryScreenController.step.value++;
                    },
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .08,
                        vertical: height * .02,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors().mainColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ödeme için Devam Et ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors().textFieldTitleColor,
                        size: 18,
                      ),
                      SizedBox(width: width * .01),
                      Text(
                        "Güvenli Ödeme",
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          // fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .01),
                ],
              ),
            ),
          ),
        );
      case 1:
        return PaymentAndReviewBottomBarChild(
          height: height,
          width: width,
          buttonText: "Siparişi Tamamla",
          onTap: () {
            deliveryScreenController.step.value++;
          },
          widget: Text(
            "(219₺ KDV dahil)",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        );
      case 2:
        return PaymentAndReviewBottomBarChild(
          height: height,
          width: width,
          buttonText: "Sipariş Ver",
          onTap: () {
            // Home çizildikten sonra konfeti patlat
            Future.delayed(const Duration(milliseconds: 120), () {
              Get.find<DeliveryAddressScreenController>().blast();
            });
            Get.snackbar(
              "Başarılı",
              "Siparişiniz alındı",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              margin: const EdgeInsets.all(12),
              borderRadius: 12,
              duration: const Duration(seconds: 2),
            );
            // Get.rawSnackbar(
            //   message: "Adres başarıyla kaydedildi",
            //   snackPosition: SnackPosition.BOTTOM,
            //   backgroundColor: Colors.black87,
            //   borderRadius: 14,
            //   margin: const EdgeInsets.all(16),
            //   duration: const Duration(seconds: 2),
            // );
            // Get.snackbar(
            //   "",
            //   "Ürün sepete eklendi",
            //   snackPosition: SnackPosition.BOTTOM,
            //   backgroundColor: Colors.white,
            //   colorText: Colors.black,
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //   borderRadius: 16,
            //   animationDuration: const Duration(milliseconds: 300),
            // );
          },
          widget: SizedBox(),
        );
      default:
        return SafeArea(top: false, child: SizedBox());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final args = Get.arguments;
    return Obx(
      () => Scaffold(
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
              Padding(
                padding: EdgeInsets.only(left: width * .03),
                child: GestureDetector(
                  onTap: () {
                    if (deliveryScreenController.step.value > 0) {
                      deliveryScreenController.step.value--;
                    } else {
                      Get.back();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: width * .03),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
              SizedBox(width: width * .04),
              // TITLE AREA
              Expanded(
                child: Text(
                  "Teslimat Adresi",
                  style: TextStyle(
                    color: AppColors().fontColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          bottom: buildCheckoutStepBar(context),
        ),
        bottomNavigationBar: _bottomBar(
          deliveryScreenController.step.value,
          context,
        ),
        body: IndexedStack(
          index: deliveryScreenController.step.value,
          children: [
            DeliveryAddressBody(
              width: width,
              height: height,
              fullNameController: fullNameController,
              phoneNumberController: phoneNumberController,
              countryController: TextEditingController(text: "Türkiye"),
              cityController: cityController,
              districtController: districtController,
              streetController: streetController,
              deliveryScreenController: deliveryScreenController,
            ),
            PaymentBody(), // ✅ 2. step widget
            ReviewBody(), // ✅ 3. step widget
          ],
        ),
      ),
    );
  }
}

class PaymentAndReviewBottomBarChild extends StatelessWidget {
  const PaymentAndReviewBottomBarChild({
    super.key,
    required this.height,
    required this.width,
    required this.buttonText,
    required this.onTap,
    required this.widget,
  });

  final double height;
  final double width;
  final String buttonText;
  final VoidCallback onTap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: Container(
          padding: EdgeInsets.only(
            top: height * .025,
            left: width * .04,
            right: width * .04,
          ),
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            border: Border(
              left: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide.none,
              top: BorderSide(
                width: 1,
                color: AppColors().borderColor,
              ), // zaten yok
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kargo",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors().subColor,
                    ),
                  ),
                  Text(
                    "Ücretsiz",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),

                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Text(
                  //           "Ücretsiz kargoya son ",
                  //           style: const TextStyle(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //         Text(
                  //           NumberFormat.currency(
                  //             locale: "tr_TR",
                  //             symbol: "₺",
                  //           ).format(1500 - 1490),
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w600,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(height: height * .01),
                  //     SliderTheme(
                  //       data: SliderTheme.of(context).copyWith(
                  //         thumbShape:
                  //             SliderComponentShape.noThumb, // 👈 thumb yok
                  //         activeTrackColor: AppColors().merchantColor,
                  //         inactiveTrackColor: Colors.black,
                  //         overlayShape: SliderComponentShape
                  //             .noOverlay, // basınca çıkan halka da yok
                  //       ),
                  //       child: Slider(
                  //         value: 1490,
                  //         min: 0,
                  //         max: 1500,
                  //         divisions: 10,
                  //         onChanged: (value) {},
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toplam",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: "tr_TR",
                          symbol: "₺",
                        ).format(2190),
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: AppColors().mainColor,
                        ),
                      ),
                      widget,
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * .015),
              InkWell(
                onTap: onTap,
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .08,
                    vertical: height * .02,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors().mainColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$buttonText ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors().textFieldTitleColor,
                    size: 18,
                  ),
                  SizedBox(width: width * .01),
                  Text(
                    "Güvenli SSL Ödeme",
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      // fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .01),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryAddressBody extends StatelessWidget {
  DeliveryAddressBody({
    super.key,
    required this.width,
    required this.height,
    required this.fullNameController,
    required this.phoneNumberController,
    required this.countryController,
    required this.cityController,
    required this.districtController,
    required this.streetController,
    required this.deliveryScreenController,
  });

  final double width;
  final double height;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController districtController;
  final TextEditingController streetController;
  final DeliveryAddressScreenController deliveryScreenController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: width,
          margin: EdgeInsets.symmetric(horizontal: width * .03),
          padding: EdgeInsets.symmetric(
            horizontal: width * .07,
            vertical: height * .01,
          ),
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12), // orta seviye
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 6), // 👈 aşağı doğru gölge
              ),
            ],
          ),
          child: Column(
            children: [
              DeliveryScreenTextField(
                width: width,
                height: height,
                fullNameController: fullNameController,
                title: "İSİM SOYİSİM",
                subTitle: "İsim Soyisim",
              ),
              SizedBox(height: height * .01),
              DeliveryScreenTextField(
                width: width,
                height: height,
                fullNameController: phoneNumberController,
                title: "TELEFON NUMARASI",
                subTitle: "Telefon Numarası",
              ),
              SizedBox(height: height * .01),
              DeliveryScreenTextField(
                width: width,
                height: height,
                fullNameController: countryController,
                title: "ÜLKE",
                subTitle: "Ülke",
              ),

              SizedBox(height: height * .01),
              DeliveryScreenTextField(
                width: width,
                height: height,
                fullNameController: cityController,
                title: "ŞEHİR",
                subTitle: "Şehir",
              ),
              SizedBox(height: height * .02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeliveryScreenTextField(
                    width: width * .37,
                    height: height,
                    fullNameController: districtController,
                    title: "İLÇE",
                    subTitle: "İlçe",
                  ),
                  SizedBox(width: width * .04),
                  DeliveryScreenTextField(
                    width: width * .37,
                    height: height,
                    fullNameController: streetController,
                    title: "MAHALLE",
                    subTitle: "Mahalle",
                  ),
                ],
              ),
              SizedBox(height: height * .01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: deliveryScreenController.checkBoxValue.value,
                    onChanged: (value) {
                      deliveryScreenController.checkBoxValue.value = value!;
                    },
                    activeColor: AppColors().merchantColor,
                  ),
                  SizedBox(width: width * .015),
                  Expanded(
                    child: Text(
                      "Varsayılan teslimat adresi olarak ayarla",
                      maxLines: 2,
                      style: TextStyle(
                        color: AppColors().reviewFilterColor,
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: height * .03),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
            vertical: height * .02,
          ),
          margin: EdgeInsets.symmetric(horizontal: width * .03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors().filterItemsColor,
          ),
          child: Row(
            children: [
              // Overlapping avatars
              SizedBox(
                width: 64,
                height: 44,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          image: const DecorationImage(
                            image: NetworkImage("https://picsum.photos/200"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 22, // overlap miktarı
                      top: 0,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          image: const DecorationImage(
                            image: NetworkImage("https://picsum.photos/201"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: width * .02),

              // Text
              Expanded(
                child: Text(
                  "Sepette 3 ürün var",
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              // Price
              Text(
                NumberFormat.currency(
                  locale: "tr_TR",
                  symbol: "₺",
                ).format(1490),
                style: TextStyle(
                  color: AppColors().deliveryScreenTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentBody extends StatelessWidget {
  PaymentBody({super.key});

  final couponController = TextEditingController();

  final deliveryScreenController = Get.find<DeliveryAddressScreenController>();

  final billingCarNumbers = ["••••4242", "PayPal"];
  final dateOrEmail = ["Skt 12/26", "alex.r@email.com"];
  final iconList = [
    Icon(Icons.payment, color: AppColors().mainColor, size: 28),
    Icon(Icons.paypal, color: Colors.blue, size: 28),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * .03),
      children: [
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * .06,
            vertical: height * .02,
          ),
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12), // orta seviye
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 6), // 👈 aşağı doğru gölge
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sipariş Toplam",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: height * .005),
                  Text(
                    "3 ürün var",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      // fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              // Price
              Text(
                NumberFormat.currency(
                  locale: "tr_TR",
                  symbol: "₺",
                ).format(1490),
                style: TextStyle(
                  color: AppColors().mainColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * .01),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .01,
            vertical: height * .01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ÖDEME YÖNTEMİ",
                style: TextStyle(
                  color: AppColors().textFieldTitleColor,
                  fontSize: 17,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AddNewPaymentMethodScreen.routeName);
                },
                child: Text(
                  "Yeni Ekle",
                  style: TextStyle(
                    color: AppColors().mainColor,
                    fontSize: 15,
                    // letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        Obx(() {
          final count = deliveryScreenController.visibleCount.value;
          final total = 4;
          return ListView.builder(
            itemCount: count.clamp(0, total),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected =
                    deliveryScreenController.selectedIndex.value == index;
                final realIndex = deliveryScreenController.items[index];

                return GestureDetector(
                  onTap: () => deliveryScreenController.select(index),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: AppColors().backGroungdColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: isSelected ? 2 : 1,
                        color: isSelected
                            ? AppColors().mainColor
                            : AppColors().borderColor,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: height * .005),
                    padding: EdgeInsets.only(
                      left: width * .05,
                      top: height * .015,
                      bottom: height * .015,
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width * .12,
                              height: height * .05,
                              decoration: BoxDecoration(
                                color: AppColors().circleAvatarBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: iconList[realIndex],
                            ),
                            SizedBox(width: width * .02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  billingCarNumbers[realIndex],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  dateOrEmail[realIndex],
                                  style: TextStyle(
                                    color: AppColors().subColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        // RADIO STYLE CHECK
                        Container(
                          width: width * .06,
                          height: height * .04,
                          margin: EdgeInsets.only(right: width * .04),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors().mainColor
                                  : Colors.grey.shade400,
                              width: 2,
                            ),
                            color: isSelected
                                ? AppColors().mainColor
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          );
        }),

        Obx(() {
          final total = 2;
          final isAllShown =
              deliveryScreenController.visibleCount.value >= total;

          return TextButton(
            onPressed: () {
              if (isAllShown) {
                deliveryScreenController.showLess();
              } else {
                deliveryScreenController.showMore(total);
              }
            },
            child: Text(
              isAllShown ? "Daha az göster" : "Daha fazla göster",
              style: TextStyle(color: AppColors().merchantColor),
            ),
          );
        }),
        SizedBox(height: height * .02),
        Padding(
          padding: EdgeInsets.only(left: width * .01),
          child: Text(
            "KUPON",
            style: TextStyle(
              color: AppColors().textFieldTitleColor,
              fontSize: 17,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * .04,
            vertical: height * .01,
          ),
          margin: EdgeInsets.only(
            top: height * .01,
            right: width * .01,
            left: width * .01,
          ),
          height: height * .083,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors().backGroungdColor,
            border: Border.all(width: 1, color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                width: width * .33,
                // height: height * .06,
                decoration: BoxDecoration(
                  color: AppColors().mainColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                margin: EdgeInsets.symmetric(vertical: height * .001),
                alignment: Alignment.center,
                child: Text(
                  "Kupon Kullan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: width * .02),
              Expanded(
                child: TextFormField(
                  controller: couponController,
                  onTapUpOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors().textFieldBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors().textFieldBorderColor,
                      ),
                    ),
                    fillColor: AppColors().textFieldFillColor,
                    hintText: "Kupon Kodu",
                    // labelText: text,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors().subColor,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors().textFieldLabelColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * .03),
      ],
    );
  }
}

class ReviewBody extends StatelessWidget {
  ReviewBody({super.key});

  final shopScreenController = Get.put(ShopScreenController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      children: [
        SizedBox(height: height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "TESLİMAT ADRESİ",
              style: TextStyle(
                color: AppColors().textFieldTitleColor,
                fontSize: 17,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Text(
            //   "Düzenle",
            //   style: TextStyle(
            //     color: AppColors().mainColor,
            //     fontSize: 15,
            //     // letterSpacing: 0.5,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ],
        ),
        SizedBox(height: height * .02),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12), // orta seviye
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 4), // 👈 aşağı doğru gölge
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: width * .05,
            top: height * .015,
            bottom: height * .015,
            right: width * .05,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors().circleAvatarBackgroundColor,
                child: Icon(
                  Icons.place_outlined,
                  color: AppColors().mainColor,
                  size: 28,
                ),
              ),
              SizedBox(width: width * .02),

              // ✅ Metin alanı Row içinde genişliği alsın
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home • Alex Rivera",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height * .004),
                    Text(
                      "248 East 44th Street, 4th Floor New York, NY 10017 United States",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis, // ✅ taşmayı engelle
                      style: TextStyle(
                        color: AppColors().subColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * .03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ÖDEME YÖNTEMİ",
              style: TextStyle(
                color: AppColors().textFieldTitleColor,
                fontSize: 17,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Text(
            //   "Düzenle",
            //   style: TextStyle(
            //     color: AppColors().mainColor,
            //     fontSize: 15,
            //     // letterSpacing: 0.5,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ],
        ),
        SizedBox(height: height * .02),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12), // orta seviye
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 4), // 👈 aşağı doğru gölge
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: width * .05,
            top: height * .015,
            bottom: height * .015,
            right: width * .01,
          ),
          child: Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors().circleAvatarBackgroundColor,
                    child: Icon(
                      Icons.payment_rounded,
                      color: AppColors().mainColor,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: width * .02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Visa ending in 4242",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Skt 12/26",
                        style: TextStyle(
                          color: AppColors().subColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  // Get.toNamed(DeliveryAddressScreen.routeName);
                },
                icon: Icon(Icons.verified_outlined, color: Colors.green),
              ),
            ],
          ),
        ),
        SizedBox(height: height * .02),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "SİPARİŞLERİNİZ (3)",
            style: TextStyle(
              color: AppColors().textFieldTitleColor,
              fontSize: 17,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: height * .02),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: AppColors().backGroungdColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12), // orta seviye
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 4), // 👈 aşağı doğru gölge
              ),
            ],
          ),
          padding: EdgeInsets.only(top: height * .015, bottom: height * .015),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Product product = shopScreenController.firstFour[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: height * .01),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .05),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // IMAGE
                          Container(
                            width: width * .2,
                            height: height * .09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(product.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(width: width * .03),

                          // RIGHT SIDE
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TITLE + PRICE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      // 🔥 title alanı esnek
                                      child: Text(
                                        product.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColors().fontColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 8),
                                  ],
                                ),

                                SizedBox(height: height * .015),

                                // QUANTITY
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: height * .03,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors().backGroungdColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Adet: ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: "tr_TR",
                                        symbol: "₺",
                                      ).format(product.price),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors().mainColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    shopScreenController.firstFour.length - 1 != index
                        ? Divider(color: Colors.grey.shade300)
                        : SizedBox(),
                  ],
                ),
              );
            },
            itemCount: shopScreenController.firstFour.length,
          ),
        ),
      ],
    );
  }
}

class DeliveryScreenTextField extends StatelessWidget {
  DeliveryScreenTextField({
    super.key,
    required this.width,
    required this.height,
    required this.fullNameController,
    required this.title,
    required this.subTitle,
  });

  final double width;
  final double height;
  final TextEditingController fullNameController;
  String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .01),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors().subColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: height * .005),
        TextFormFieldWidget(
          width: width,
          nameSurnameController: fullNameController,
          text: subTitle,
        ),
      ],
    );
  }
}
