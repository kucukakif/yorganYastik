import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:yorgan_yastik/repo/controllers/bottom_navigator_screen_controller.dart';
import 'package:yorgan_yastik/screens/account_screen.dart';
import 'package:yorgan_yastik/screens/shopping_cart_screen.dart';
import 'package:yorgan_yastik/screens/favourite_screen.dart';
import 'package:yorgan_yastik/screens/shop_screen.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class BottomNavigatorScreen extends StatelessWidget {
  static const routeName = '/bottomNavigator';
  BottomNavigatorScreen({super.key});

  final bottomNavigatorScreenController = Get.put(
    BottomNavigatorScreenController(),
  );
  final pagesList = [
    ShopScreen(),
    FavouriteScreen(),
    ShoppingCartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false; // tamamen engelle
        },
        child: Scaffold(
          backgroundColor: AppColors().backGroungdColor,
          body: pagesList[bottomNavigatorScreenController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavigatorScreenController.currentIndex.value,
            onTap: (value) {
              bottomNavigatorScreenController.currentIndex.value = value;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors().backGroungdColor,
            selectedItemColor: AppColors().mainColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: AppColors().mainColor),
            unselectedIconTheme: IconThemeData(
              color: AppColors().textFieldTitleColor,
            ),
            unselectedItemColor: AppColors().textFieldTitleColor,
            unselectedLabelStyle: TextStyle(
              color: AppColors().textFieldTitleColor,
              // fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            selectedLabelStyle: TextStyle(
              color: AppColors().mainColor,
              // fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bottomBarIcons/shop-icon.svg',
                  width: 20,
                  height: 20,
                  color: bottomNavigatorScreenController.currentIndex.value == 0
                      ? AppColors().mainColor
                      : AppColors().textFieldTitleColor,
                ),
                label: "Mağaza",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bottomBarIcons/favourite-icon.svg',
                  width: 20,
                  height: 20,
                  color: bottomNavigatorScreenController.currentIndex.value == 1
                      ? AppColors().mainColor
                      : AppColors().textFieldTitleColor,
                ),
                label: "Favorilerim",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bottomBarIcons/basket-icon.svg',
                  width: 20,
                  height: 20,
                  color: bottomNavigatorScreenController.currentIndex.value == 2
                      ? AppColors().mainColor
                      : AppColors().textFieldTitleColor,
                ),
                label: "Sepetim",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bottomBarIcons/account-icon.svg',
                  width: 20,
                  height: 20,
                  color: bottomNavigatorScreenController.currentIndex.value == 3
                      ? AppColors().mainColor
                      : AppColors().textFieldTitleColor,
                ),
                label: "Hesabım",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
