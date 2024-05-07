
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/styles/app_text_style.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.isVisible,
    required this.suffix,

  });

  final TextEditingController controller;
  final String iconPath;
  final bool isVisible;
  final Widget suffix;


  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {



    return TextFormField(
      controller: widget.controller,
      obscureText: !widget.isVisible,
      style: AppTextStyle.rubikSemiBold.copyWith(color:Colors.black),
      validator: (String? value) {
        if (value == null || value.isEmpty || !AppConstants.passwordRegExp
            .hasMatch(value)) {
          return "To'gri parol kiriting!";
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        errorStyle: AppTextStyle.rubikSemiBold.copyWith(color: Colors.red),
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.iconPath.isNotEmpty ? 16.h : 8.h,
          horizontal: 1.h,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_2C2C73,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_2C2C73,
          ),
        ),
        prefixIcon: widget.iconPath.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: SvgPicture.asset(widget.iconPath),
              )
            : null,
        suffix: widget.suffix,
        hintText: "Password",
        hintStyle: AppTextStyle.rubikSemiBold.copyWith(
          fontSize: 15,
          color: AppColors.c_090F47.withOpacity(0.45),
        ),
      ),
    );
  }
}
