import 'package:flutter/material.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().backGroungdColor,
      // appBar: AppBar(
      //   backgroundColor: AppColors().backGroungdColor,
      //   leadingWidth: width * .35,
      //   leading: Align(
      //     alignment: Alignment.centerLeft,
      //     child: Padding(
      //       padding: EdgeInsets.only(left: width * .06),
      //       child: Text(
      //         "Hesabım",
      //         style: TextStyle(
      //           color: AppColors().fontColor,
      //           fontSize: 22,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(right: width * .04),
      //       child: Icon(Icons.settings, size: 25),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width,
                height: height * .16,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: height * .03),
                    Text(
                      "Ahmet Yılmaz",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "ahmetyilmaz@gmail.com",
                      style: TextStyle(color: AppColors().textFieldTitleColor),
                    ),
                    // SizedBox(height: height * .03),
                  ],
                ),
              ),
              SizedBox(height: height * .005),
              AccountScreenSection(
                sectionName: "Hesap Bilgileri",
                onTap: () {},
                icon: Icons.person,
              ),
              AccountScreenSection(
                sectionName: "Geçmiş Siparişler",
                onTap: () {},
                icon: Icons.shopping_basket_rounded,
              ),
              AccountScreenSection(
                sectionName: "Kayıtlı Adresler",
                onTap: () {},
                icon: Icons.place_rounded,
              ),
              AccountScreenSection(
                sectionName: "Kayıtlı Kartlar",
                onTap: () {},
                icon: Icons.payment_rounded,
              ),
              AccountScreenSection(
                sectionName: "Yardım ve Destek",
                onTap: () {},
                icon: Icons.info,
              ),
              SizedBox(height: height * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_rounded, color: Colors.red),
                  SizedBox(width: width * .005),
                  Text(
                    "Çıkış Yap",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .015),
              Text(
                "VERSİYON 1.0.0",
                style: TextStyle(
                  color: AppColors().textFieldTitleColor,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: height * .02),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountScreenSection extends StatelessWidget {
  const AccountScreenSection({
    super.key,
    required this.sectionName,
    required this.onTap,
    required this.icon,
  });

  final String sectionName;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * .04,
        vertical: height * .008,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * .04,
        vertical: height * .015,
      ),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: width * .13,
            height: height * .06,
            decoration: BoxDecoration(
              color: AppColors().circleAvatarBackgroundColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors().mainColor, size: 29),
          ),
          SizedBox(width: width * .04),
          Text(
            sectionName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
