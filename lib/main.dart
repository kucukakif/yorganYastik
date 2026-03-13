import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:yorgan_yastik/repo/controllers/add_new_payment_method_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/bottom_navigator_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/category_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/delivery_address_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/product_detail_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/quick_checkout_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/shop_screen_controller.dart';
import 'package:yorgan_yastik/screens/account_screen.dart';
import 'package:yorgan_yastik/screens/add_new_payment_method_screen.dart';
import 'package:yorgan_yastik/screens/bottom_navigator_screen.dart';
import 'package:yorgan_yastik/screens/category_screen.dart';
import 'package:yorgan_yastik/screens/delivery_address_screen.dart';
import 'package:yorgan_yastik/screens/edit_address_screen.dart';
import 'package:yorgan_yastik/screens/new_address_screen.dart';
import 'package:yorgan_yastik/screens/favourite_screen.dart';
import 'package:yorgan_yastik/screens/forget_pasword_screen.dart';
import 'package:yorgan_yastik/screens/login_screen.dart';
import 'package:yorgan_yastik/screens/product_details_screen.dart';
import 'package:yorgan_yastik/screens/quick_checkout_screen.dart';
import 'package:yorgan_yastik/screens/register_screen.dart';
import 'package:yorgan_yastik/screens/reviews_scren.dart';
import 'package:yorgan_yastik/screens/shop_filter_screen.dart';
import 'package:yorgan_yastik/screens/shop_screen.dart';
import 'package:yorgan_yastik/screens/shopping_cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Text(details.toString()),
        ),
      ),
    );
  };

  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details, forceReport: true);
  };

  // 3) Async yakalanmayan hataları da yakala
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('UNCAUGHT ERROR: $error');
    debugPrint(stack.toString());
    return true;
  };
  await dotenv.load(fileName: "api-documents.env");
  WebViewPlatform.instance = WebKitWebViewPlatform();
  runApp(const MainApp());
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShopScreenController());
    Get.lazyPut<BottomNavigatorScreenController>(
      () => BottomNavigatorScreenController(),
    );
    Get.lazyPut<CategoryScreenController>(() => CategoryScreenController());
    Get.lazyPut<QuickCheckoutScreenController>(
      () => QuickCheckoutScreenController(),
    );
    Get.put(DeliveryAddressScreenController());
    Get.lazyPut<ProductDetailScreenController>(
      () => ProductDetailScreenController(),
    );
    Get.lazyPut<AddNewPaymentMethodScreenController>(
      () => AddNewPaymentMethodScreenController(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: LoginScreen.routeName,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(name: RegisterScreen.routeName, page: () => RegisterScreen()),
        GetPage(
          name: ForgetPaswordScreen.routeName,
          page: () => ForgetPaswordScreen(),
        ),
        GetPage(
          name: BottomNavigatorScreen.routeName,
          page: () => BottomNavigatorScreen(),
        ),
        GetPage(name: ShopScreen.routeName, page: () => ShopScreen()),
        GetPage(name: CategoryScreen.routeName, page: () => CategoryScreen()),
        GetPage(
          name: ProductDetailsScreen.routeName,
          page: () => ProductDetailsScreen(),
        ),
        GetPage(name: ReviewsScren.routeName, page: () => ReviewsScren()),
        GetPage(
          name: ShoppingCartScreen.routeName,
          page: () => ShoppingCartScreen(),
        ),
        GetPage(name: FavouriteScreen.routeName, page: () => FavouriteScreen()),
        GetPage(
          name: QuickCheckoutScreen.routeName,
          page: () => QuickCheckoutScreen(),
        ),
        GetPage(
          name: DeliveryAddressScreen.routeName,
          page: () => DeliveryAddressScreen(),
        ),

        GetPage(
          name: AddNewPaymentMethodScreen.routeName,
          page: () => AddNewPaymentMethodScreen(),
        ),
        GetPage(
          name: NewAddressScreen.routeName,
          page: () => NewAddressScreen(),
        ),
        GetPage(
          name: ShopFilterScreen.routeName,
          page: () => ShopFilterScreen(),
        ),
        GetPage(name: AccountScreen.routeName, page: () => AccountScreen()),
        GetPage(
          name: EditAddressScreen.routeName,
          page: () => EditAddressScreen(),
        ),
        // GetPage(
        //   name: Paym.routeName,
        //   page: () => EditAddressScreen(),
        // ),
      ],
    );
  }
}
