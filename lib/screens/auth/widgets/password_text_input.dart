import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/app_constants.dart';
import 'package:banking_app/utils/app_images.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordTextInput extends StatefulWidget {
  const PasswordTextInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextInput> createState() => _PasswordTextInputState();
}

class _PasswordTextInputState extends State<PasswordTextInput> {
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 10,
      child: TextFormField(
        style: TextStyle(
          color: AppColors.white.withOpacity(.8),
          fontSize: 13.w,
          fontWeight: FontWeight.w400,
        ),
        controller: widget.controller,
        obscureText: passwordVisibility,
        validator: (String? value) {
          if (value == null ||
              value.isEmpty ||
              value.length < 3 ||
              !AppConstants.passwordRegExp.hasMatch(value)) {
            return "Enter true password";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: AppColors.c_262626,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(AppImages.password),
          ),
          contentPadding: const EdgeInsets.all(12),
          labelText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              passwordVisibility = !passwordVisibility;
              setState(() {});
            },
            icon: passwordVisibility
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          labelStyle: TextStyle(
            color: AppColors.white.withOpacity(.8),
            fontSize: 13.w,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
