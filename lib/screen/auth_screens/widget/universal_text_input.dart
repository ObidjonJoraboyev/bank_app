
import 'package:exson_bank/screen/auth_screens/widget/snacbar.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class UniversalTextField extends StatelessWidget {
  const UniversalTextField({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.hintText,
    required this.type,
    required this.regExp,
    required this.errorText,
    this.labelText, this.onChanged,
  });

  final TextEditingController controller;
  final String iconPath;
  final String hintText;
  final String errorText;
  final TextInputType type;
  final RegExp regExp;
  final String? labelText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: type,
      style: AppTextStyle.rubikSemiBold.copyWith(
        fontSize: 15,
        color: Colors.black,
      ),
      validator: (String? value) {
        if (value == null ||
            value.isEmpty ||
            !regExp.hasMatch(value) ||
            value.length < 3  ) {
          return errorText;
        } else {

          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 1.w,
        ),
        errorStyle: AppTextStyle.rubikSemiBold.copyWith(color: Colors.red),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_090F47.withOpacity(0.3),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_090F47.withOpacity(0.3),
          ),
        ),
        prefixIcon: iconPath.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: SvgPicture.asset(
                  iconPath,width: 22,color: AppColors.c_2C2C73,
                  // colorFiltewr: const ColorFilter.mode(
                  //   AppColors.c_C4C4C4,
                  //   BlendMode.srcIn,
                  // ),
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: AppTextStyle.rubikSemiBold.copyWith(
          fontSize: 15,
          color: AppColors.c_090F47.withOpacity(0.45),
        ),
      ),
    );
  }
}
List<String> kod = ["@gmail.com","@gmail.ru"];

String a = "@gmail.com";

bool checkGmail(String email) {
  return email.contains('@gmail.com');
}