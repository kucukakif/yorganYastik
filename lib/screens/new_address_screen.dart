import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/repo/controllers/new_address_screen_controller.dart';
import 'package:yorgan_yastik/screens/delivery_address_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class NewAddressScreen extends StatelessWidget {
  static const routeName = '/newAddress';
  NewAddressScreen({super.key});

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController(text: "Türkiye");
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final streetController = TextEditingController();
  final editAddressScreenController = NewAddressScreenController();
  // final String

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: EdgeInsets.only(right: width * .03),
                    child: Image.asset(
                      'assets/icons/arrow-left.png',
                      width: 22,
                      color: AppColors().iconColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * .04),
              // TITLE AREA
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Adresi Düzenle",
                    style: TextStyle(
                      color: AppColors().fontColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'TESLİMAT DETAYLARI',
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontSize: 13,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * .04),
              child: Icon(
                Icons.info_outline_rounded,
                size: 28,
                color: AppColors().reviewFilterColor,
              ),
            ),
            SizedBox(width: width * .01),
          ],

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade200,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: height * .02),
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
                border: Border.all(width: 1.2, color: Colors.grey.shade200),
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Varsayılan adres olarak ayarla",
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "Bundan sonraki tüm siparişleriniz için bunu kullanın.",
                              style: TextStyle(
                                color: AppColors().subColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width * .01),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * .01,
                          bottom: height * .03,
                          top: height * .03,
                        ),
                        child: Switch(
                          activeColor: AppColors().merchantColor,
                          value: editAddressScreenController.switchValue.value,
                          onChanged: (value) {
                            editAddressScreenController.switchValue.value =
                                value;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .09),
              child: Text(
                "Gönderim bilgileriniz güvenli bir şekilde saklanır ve yalnızca siparişin yerine getirilmesi ve teslimatı için kullanılır.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors().textFieldTitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Spacer(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: height * .005,
                horizontal: width * .04,
              ),

              decoration: BoxDecoration(
                color: AppColors().backGroungdColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .08,
                    vertical: height * .02,
                  ),
                  height: height * .07,
                  margin: EdgeInsets.only(
                    top: height * .02,
                    bottom: height * .01,
                    right: width * .03,
                    left: width * .03,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors().mainColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Değişiklikleri Kaydet",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
