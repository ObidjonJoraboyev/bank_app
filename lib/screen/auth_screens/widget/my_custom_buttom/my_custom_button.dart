import 'dart:developer';

import 'package:exson_bank/utils/colors/app_colors.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton(
      {super.key, required this.onTap, this.readyToSubmit = true, this.isLoading = false, required this.title});

  final VoidCallback onTap;
  final bool readyToSubmit;
  final bool isLoading;
  final String title;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:
      TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            backgroundColor: readyToSubmit ?  AppColors.c_090F47 : Colors.grey
        ),
        onPressed: readyToSubmit ? onTap : null,
        child: Center(child: isLoading
            ? SizedBox(
          width: 36.h,
          height: 36.h,
          child: const CircularProgressIndicator.adaptive(strokeWidth: 5,),)
            : Text(title,style: const TextStyle(color: Colors.white),),),
      ),
    );
  }
}
