import 'package:flutter/material.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({
    super.key,
    required this.width,
    required this.height,
    required this.iconPath,
    required this.typeOfLogin,
    required this.uniqHeight,
    required this.uniqWidth,
  });

  final double width;
  final double height;
  final String iconPath;
  final String typeOfLogin;
  final double uniqWidth;
  final double uniqHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .37,
      height: height * .07,
      decoration: BoxDecoration(
        color: AppColors().backGroungdColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors().borderColor),
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: uniqWidth,
            height: uniqHeight,
            fit: BoxFit.fill,
          ),
          Text(
            typeOfLogin,
            style: TextStyle(
              color: AppColors().textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
