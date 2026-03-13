import 'package:flutter/material.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    super.key,
    required this.height,
    required this.text,
    required this.onTap,
  });

  final double height;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * .065,
        decoration: BoxDecoration(
          color: AppColors().mainColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors().mainColor.withOpacity(0.25),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
