import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldItems extends StatelessWidget {
  const TextFieldItems({
    super.key,
    required this.controller,
    required this.hintText,
    this.maskTextInputFormatter,
  });

  final String hintText;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters:
          maskTextInputFormatter != null ? [maskTextInputFormatter!] : null,
      controller: controller,
      style: TextStyle(
        color: AppColors.c_7F8192,
        fontSize: 16.w,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.c_7F8192,
          fontSize: 14.w,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: const Color(0xFF23265A),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: const Color(0xFF858BE9),
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: const Color(0xFF858BE9),
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
