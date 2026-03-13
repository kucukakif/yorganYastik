import 'package:flutter/material.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.width,
    required this.nameSurnameController,
    required this.text,
    this.icon,
  });

  final double width;
  final TextEditingController nameSurnameController;
  final String text;
  final IconButton? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: nameSurnameController,
        onTapUpOutside: (e) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors().textFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors().textFieldBorderColor),
          ),
          fillColor: AppColors().textFieldFillColor,
          hintText: text,
          // labelText: text,
          labelStyle: TextStyle(fontSize: 16, color: AppColors().subColor),
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors().textFieldLabelColor,
          ),
          suffixIcon: icon,
        ),
      ),
    );
  }
}
