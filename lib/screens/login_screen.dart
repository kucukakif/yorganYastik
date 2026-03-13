import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/screens/bottom_navigator_screen.dart';
import 'package:yorgan_yastik/screens/forget_pasword_screen.dart';
import 'package:yorgan_yastik/screens/register_screen.dart';
import 'package:yorgan_yastik/screens/widgets/loginWithContainer.dart';
import 'package:yorgan_yastik/screens/widgets/mainActionButton.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';
import 'package:yorgan_yastik/widgets/textFormFieldWidget.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  LoginScreen({super.key});

  final nameSurnameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors().backGroungdColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .06),
              child: Column(
                children: [
                  SizedBox(height: height * .12),
                  Text(
                    "Hoşgeldin",
                    style: TextStyle(
                      fontSize: 34,
                      color: AppColors().fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Alışveriş yapmak için giriş yap",
                    style: TextStyle(fontSize: 17, color: AppColors().subColor),
                  ),
                  SizedBox(height: height * .05),
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
                        nameSurnameController: nameSurnameController,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Şifre",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors().textFieldTitleColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  Get.toNamed(ForgetPaswordScreen.routeName),
                              child: Text(
                                "Şifremi Unuttum?",
                                style: TextStyle(
                                  color: AppColors().mainColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
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
                  SizedBox(height: height * .04),
                  MainActionButton(
                    height: height,
                    text: "Giriş Yap",
                    onTap: () {
                      Get.toNamed(BottomNavigatorScreen.routeName);
                    },
                  ),
                  SizedBox(height: height * .05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hesabın yok mu? ",
                        style: TextStyle(
                          color: AppColors().textFieldLabelColor,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RegisterScreen.routeName);
                        },
                        child: Text(
                          "Kayıt Ol",
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
                        style: TextStyle(
                          color: AppColors().textFieldTitleColor,
                        ),
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
                  Text(
                    "Gizlilik Politikası • Hizmet Şartları",
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
