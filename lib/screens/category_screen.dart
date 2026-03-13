import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/repo/controllers/bottom_navigator_screen_controller.dart';
import 'package:yorgan_yastik/repo/controllers/category_screen_controller.dart';
import 'package:yorgan_yastik/screens/bottom_navigator_screen.dart';
import 'package:yorgan_yastik/screens/product_details_screen.dart';
import 'package:yorgan_yastik/screens/widgets/categoryProductCard.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';
  CategoryScreen({super.key});

  final categoryScreenController = Get.put(CategoryScreenController());

  final filterNames = ['Fiyat', 'Renk', 'Marka'];
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final categoryName = (args is List && args.isNotEmpty && args[0] != null)
        ? args[0].toString()
        : '';
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: AppColors().fontColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${categoryScreenController.filtered.length} ürün',
                    style: TextStyle(
                      color: AppColors().textFieldTitleColor,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors().iconColor),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * .04),
            child: InkWell(
              onTap: () {
                BottomNavigatorScreenController
                bottomNavigatorScreenController = Get.put(
                  BottomNavigatorScreenController(),
                );
                bottomNavigatorScreenController.currentIndex.value = 2;
                Get.to(
                  () => BottomNavigatorScreen(),
                  transition: Transition.cupertino,
                );
              },
              child: SvgPicture.asset(
                'assets/icons/bottomBarIcons/basket-icon.svg',
                width: 20,
                height: 20,
                color: AppColors().iconColor,
              ),
            ),
          ),
          SizedBox(width: width * .01),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        ),
      ),
      body: Column(
        // scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: width * .03,
              top: height * .02,
              bottom: height * .01,
            ),
            child: Row(
              children: [
                Container(
                  width: width * .24,
                  height: height * .045,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors().mainColor,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/filter-icon.png',
                        width: 15,
                        height: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: width * .01),
                      Text(
                        "Filtrele",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * .02),
                SizedBox(
                  height: height * .04,
                  width: width * .71,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width * .22,
                        height: height * .04,
                        margin: EdgeInsets.symmetric(horizontal: width * .01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors().filterItemsColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(filterNames[index]),
                      );
                    },
                    itemCount: filterNames.length,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
          SizedBox(height: height * .01),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ProductDetailsScreen(),
                      arguments: categoryScreenController.filtered[index],
                      transition: Transition.cupertino,
                    );
                  },
                  child: CategoryProductCard(
                    imageUrl: categoryScreenController.filtered[index].imageUrl,
                    title: categoryScreenController.filtered[index].title,
                    subtitle: categoryScreenController
                        .filtered[index]
                        .attributeValues
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    priceText: categoryScreenController.filtered[index].price
                        .toInt(),
                    rating: 4.7,
                    ratingCountText: '(3.897)',
                  ),
                );
              },
              itemCount: categoryScreenController.filtered.length,
            ),
          ),
        ],
      ),
    );
  }
}
