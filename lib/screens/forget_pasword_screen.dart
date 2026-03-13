import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/screens/widgets/mainActionButton.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';
import 'package:yorgan_yastik/widgets/textFormFieldWidget.dart';

class ForgetPaswordScreen extends StatelessWidget {
  static const routeName = '/forgetPassword';
  ForgetPaswordScreen({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().backGroungdColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * .1),
                  Text(
                    "Şifremi Unuttum?",
                    style: TextStyle(
                      color: AppColors().fontColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: height * .02),
                  Text(
                    "Sıfırlama bağlantısını almak için e-posta adresinizi girin.",
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
                        nameSurnameController: emailController,
                        text: "E-posta Adresi",
                      ),
                      SizedBox(height: height * .02),
                      MainActionButton(
                        height: height,
                        text: "Gönder",
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/arrow-left.png",
                              width: 15,
                              height: 15,
                              color: AppColors().subColor,
                            ),
                            Text(
                              "Girişe Geri Dön",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors().subColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
