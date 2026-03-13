import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class EditAddressScreen extends StatelessWidget {
  static const routeName = '/editAddress';
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  Get.back();
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
      ),
    );
  }
}
