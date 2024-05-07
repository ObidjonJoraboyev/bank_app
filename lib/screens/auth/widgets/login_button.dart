import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class LoginButtonItems extends StatelessWidget {
  const LoginButtonItems(
      {super.key,
      required this.onTap,
      required this.isLoading,
      required this.active});

  final VoidCallback onTap;
  final bool isLoading;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 18.h,
          horizontal: 80.w,
        ),
        backgroundColor:
            active ? AppColors.c_262626 : AppColors.c_262626.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: active ? onTap : null,
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                "LOGIN",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 13.w,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
