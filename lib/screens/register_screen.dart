import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:yorgan_yastik/repo/controllers/register_screen_controller.dart';
import 'package:yorgan_yastik/screens/login_screen.dart';
import 'package:yorgan_yastik/screens/widgets/loginWithContainer.dart';
import 'package:yorgan_yastik/screens/widgets/mainActionButton.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';
import 'package:yorgan_yastik/widgets/textFormFieldWidget.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  RegisterScreen({super.key});

  final nameSurnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final registerScreenController = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().backGroungdColor,
      appBar: AppBar(
        backgroundColor: AppColors().backGroungdColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Image.asset(
            "assets/icons/arrow-left.png",
            width: 20,
            height: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Hesap Oluştur",
          style: TextStyle(
            fontSize: 24,
            color: AppColors().fontColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .06),
          child: Obx(
            () => ListView(
              children: [
                SizedBox(height: height * .06),
                Text(
                  "Topluluğumuza Katıl",
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors().fontColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "En kaliteli ev tekstili ürünlerini ve özel fırsatları deneyimleyin.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: AppColors().subColor),
                ),
                SizedBox(height: height * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .01),
                      child: Text(
                        "İsim Soyisim",
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .005),
                    TextFormFieldWidget(
                      width: width,
                      nameSurnameController: nameSurnameController,
                      text: "İsim Soyisim",
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .01),
                      child: Text(
                        "E-posta Adresi",
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .005),
                    TextFormFieldWidget(
                      width: width,
                      nameSurnameController: emailController,
                      text: "E-posta Adresi",
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .01),
                      child: Text(
                        "Şifre",
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .005),
                    TextFormFieldWidget(
                      width: width,
                      nameSurnameController: passwordController,
                      text: "Şifre",
                      icon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .01),
                      child: Text(
                        "Şifre Tekrar",
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: height * .005),
                    TextFormFieldWidget(
                      width: width,
                      nameSurnameController: rePasswordController,
                      text: "Şifre Tekrar",
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Row(
                  children: [
                    Checkbox(
                      value: registerScreenController.privacyValue.value,
                      onChanged: (value) {
                        registerScreenController.privacyValue.value = value!;
                      },
                      activeColor: AppColors().mainColor,
                    ),
                    SizedBox(width: width * .008),
                    Text.rich(
                      TextSpan(
                        text: "Kullanım Şartları ve Gizlilik Politikası",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "'nı\nkabul ediyorum.",
                            style: TextStyle(color: AppColors().subColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                MainActionButton(
                  height: height,
                  text: "Hesap Oluştur",
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(height: height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hesabın var mı? ",
                      style: TextStyle(
                        color: AppColors().textFieldLabelColor,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                          color: AppColors().mainColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .05),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: height * .002,
                      width: width * .35,
                      decoration: BoxDecoration(
                        color: AppColors().textFieldBorderColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(width: width * .05),
                    Text(
                      "veya",
                      style: TextStyle(color: AppColors().textFieldTitleColor),
                    ),
                    SizedBox(width: width * .05),
                    Container(
                      height: height * .002,
                      width: width * .35,
                      decoration: BoxDecoration(
                        color: AppColors().textFieldBorderColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginWithWidget(
                      width: width,
                      height: height,
                      iconPath: 'assets/icons/google-logo.webp',
                      typeOfLogin: "Google",
                      uniqHeight: height * .045,
                      uniqWidth: width * .1,
                    ),
                    SizedBox(width: width * .05),
                    LoginWithWidget(
                      width: width,
                      height: height,
                      iconPath: 'assets/icons/apple-logo.webp',
                      typeOfLogin: " Apple",
                      uniqHeight: height * .03,
                      uniqWidth: width * .065,
                    ),
                  ],
                ),
                SizedBox(height: height * .04),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Yardıma mı ihtiyacın var?  ",
                      style: TextStyle(
                        color: AppColors().textFieldTitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        // Destek kısmını whattsap ile bağla.
                        TextSpan(
                          text: "Destek",
                          style: TextStyle(color: AppColors().mainColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
