import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yorgan_yastik/screens/widgets/categoryProductCard.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class ReviewsScren extends StatelessWidget {
  static const routeName = '/reviews';
  ReviewsScren({super.key});

  final reviewNamesList = ['Sarah Mitchell', 'James David', 'Elena K.'];
  final reviews = [
    "Absolutely the best sleep I've had in years. The memory foam contours perfectly to my neck and provides just the right amount of support without being too stiff.",
    "Great pillow, though it took a couple of nights to air out the 'new foam' smell. Once that passed, it's been fantastic.",
    "Changed my life. No more morning headaches. Highly recommend for side sleepers who need that extra height and firmness.",
  ];

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
            SizedBox(width: width * .02),
            // TITLE AREA
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ürün Yorumları",
                    style: TextStyle(
                      color: AppColors().fontColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Müşteri Yorumları',
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
          Text(
            "Yardım",
            style: TextStyle(
              color: AppColors().mainColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(width: width * .03),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * .03),
        children: [
          Container(
            width: width.toDouble(),
            height: height * .278,
            margin: EdgeInsets.symmetric(vertical: height * .02),
            padding: EdgeInsets.symmetric(
              horizontal: width * .02,
              vertical: height * .025,
            ),
            decoration: BoxDecoration(
              color: AppColors().backGroungdColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: AppColors().borderColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "4.7",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(4, (_) => const Star(full: true)),
                            const Star(full: false),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "1,248",
                              style: TextStyle(
                                color: AppColors().textFieldTitleColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              " Yorum",
                              style: TextStyle(
                                color: AppColors().textFieldTitleColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: width * .04),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ratingBar(5, 0.7, context),
                            _ratingBar(4, 0.2, context),
                            _ratingBar(3, 0.05, context),
                            _ratingBar(2, 0.03, context),
                            _ratingBar(1, 0.02, context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .01),
                Container(
                  width: width.toDouble(),
                  height: height * .057,
                  decoration: BoxDecoration(
                    color: AppColors().backGroungdColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors().mainColor, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Bir Yorum Yaz",
                    style: TextStyle(
                      color: AppColors().mainColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * .02,
              horizontal: width * .02,
            ),
            child: Row(
              children: [
                Container(
                  width: width * .28,
                  height: height * .045,
                  decoration: BoxDecoration(
                    color: AppColors().mainColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Tüm Yorumlar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: width * .02),
                Container(
                  width: width * .27,
                  height: height * .045,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors().filterItemsColor,
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Fotoğraflı",
                    style: TextStyle(
                      color: AppColors().reviewFilterColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: width * .02),
                Container(
                  width: width * .27,
                  height: height * .045,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors().filterItemsColor,
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "5 yıldızlı",
                    style: TextStyle(
                      color: AppColors().reviewFilterColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Review(
                width: width,
                height: height,
                nameOfReviewOwner: reviewNamesList[index],
                reviewText: reviews[index],
              );
            },
            itemCount: reviewNamesList.length,
          ),
        ],
      ),
    );
  }

  Widget _ratingBar(int star, double value, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * .005),
      child: Row(
        children: [
          Text(
            "$star",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: width * .04),
          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: height * .0125,
              borderRadius: BorderRadius.circular(16),
              backgroundColor: Colors.grey.shade200,
              color: AppColors().mainColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    super.key,
    required this.width,
    required this.height,
    required this.nameOfReviewOwner,
    required this.reviewText,
  });

  final double width;
  final double height;
  final String nameOfReviewOwner;
  final String reviewText;

  String getInitials(String text) {
    return text
        .trim()
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0])
        .join()
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toDouble(),
      margin: EdgeInsets.only(bottom: height * .025),
      color: AppColors().backGroungdColor,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: AppColors().textFieldBorderColor,
                child: Center(
                  child: Text(
                    getInitials(nameOfReviewOwner),
                    style: TextStyle(
                      color: AppColors().subColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * .04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameOfReviewOwner,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(4, (_) => const Star(full: true)),
                      const Star(full: false),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * .01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .02),
            child: Text(
              reviewText,
              style: TextStyle(
                color: AppColors().reviewFilterColor,
                fontSize: 16,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
