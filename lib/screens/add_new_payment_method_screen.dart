import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/repo/controllers/add_new_payment_method_screen_controller.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class AddNewPaymentMethodScreen extends StatelessWidget {
  static const routeName = '/addNewPaymentMethod';
  AddNewPaymentMethodScreen({super.key});

  AddNewPaymentMethodScreenController addNewPaymentMethodScreenController =
      Get.put(AddNewPaymentMethodScreenController());

  final cardImagesList = [
    'assets/icons/paymentMethosIcons/mastercard.png',
    'assets/icons/paymentMethosIcons/visa.jpeg',
    'assets/icons/paymentMethosIcons/troy.png',
    'assets/icons/paymentMethosIcons/maestro.png',
  ];

  final cardHolderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cVCController = TextEditingController();

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
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
              ),
              SizedBox(width: width * .04),
              // TITLE AREA
              Expanded(
                child: Text(
                  "Ödeme Yöntemi Ekle",
                  style: TextStyle(
                    color: AppColors().fontColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(1),
          //   child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
          // ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .05,
            vertical: height * .01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .02,
                  vertical: height * .01,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kredi ve Banka Kartları",
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * .68,
                height: height * .06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width * .01,
                  vertical: height * .005,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: width * .04),
                        Image.asset(
                          cardImagesList[index],
                          width: width * .08,
                          height: height * .04,
                        ),
                        index != 3 ? SizedBox(width: width * .04) : SizedBox(),
                        index != 3
                            ? Container(
                                height: height * .05,
                                width: width * .0008,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  },
                  itemCount: 4,
                ),
              ),
              SizedBox(height: height * .02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .02),
                    child: Text(
                      "Ad Soyad",
                      style: TextStyle(
                        color: AppColors().textFieldTitleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height * .005),
                  CardInformationsTextField(
                    width: width,
                    cardHolderNameController: cardHolderNameController,
                    hintText: "Kart Üzerindeki Ad Soyad",
                    suffixIcon: null,
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .02),
                    child: Text(
                      "Kart Numarası",
                      style: TextStyle(
                        color: AppColors().textFieldTitleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height * .005),
                  CardInformationsTextField(
                    width: width,
                    cardHolderNameController: cardNumberController,
                    hintText: "•••• •••• •••• ••••",
                    suffixIcon: Icon(
                      Icons.payment_rounded,
                      color: AppColors().textFieldTitleColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .02),
                        child: Text(
                          "Son Kullanım Tarihi",
                          style: TextStyle(
                            color: AppColors().textFieldTitleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: height * .005),
                      CardInformationsTextField(
                        width: width * .43,
                        cardHolderNameController: expiryDateController,
                        hintText: "Ay/Yıl",
                        suffixIcon: null,
                      ),
                    ],
                  ),
                  SizedBox(width: width * .02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .02),
                        child: Text(
                          "Güvenlik Kodu(CVC)",
                          style: TextStyle(
                            color: AppColors().textFieldTitleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: height * .005),
                      CardInformationsTextField(
                        width: width * .43,
                        cardHolderNameController: cVCController,
                        hintText: "Cvc",
                        suffixIcon: null,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .01),
                child: Divider(color: Colors.grey.shade300),
              ),
              SizedBox(height: height * .02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "İleriki Alışverişleriniz için Saklayın",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Tek tıkla ödeme için bu kartı güvenli bir şekilde saklayın.",
                          style: TextStyle(
                            color: AppColors().subColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .01),
                    child: Switch(
                      activeColor: AppColors().merchantColor,
                      value:
                          addNewPaymentMethodScreenController.switchValue.value,
                      onChanged: (value) {
                        addNewPaymentMethodScreenController.switchValue.value =
                            value;
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),

              // Divider(color: Colors.grey.shade300),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .08,
                    vertical: height * .02,
                  ),
                  margin: EdgeInsets.only(
                    top: height * .02,
                    bottom: height * .04,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors().mainColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Kartı Ekle",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
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
}

class CardInformationsTextField extends StatelessWidget {
  const CardInformationsTextField({
    super.key,
    required this.width,
    required this.cardHolderNameController,
    required this.hintText,
    required this.suffixIcon,
  });

  final double width;
  final TextEditingController cardHolderNameController;
  final String hintText;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: cardHolderNameController,
        onTapUpOutside: (e) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors().textFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors().textFieldBorderColor),
          ),
          fillColor: AppColors().filterItemsColor,
          hintText: hintText,
          // labelText: text,
          // labelStyle: TextStyle(
          //   fontSize: 16,
          //   color: AppColors().textFieldLabelColor,
          // ),
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors().textFieldLabelColor,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: width * .04),
            child: suffixIcon,
          ),
        ),
      ),
    );
  }
}
