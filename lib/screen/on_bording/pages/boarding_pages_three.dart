import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';

class BoardingPageThree extends StatelessWidget {
  const BoardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.on_boarding_3),
        SizedBox(
          height: 20.h,
        ),
        Text(
          textAlign: TextAlign.center,
          "Your Comprehensive Resource for Financial Success",
          style: TextStyle(fontSize: 25.w, color: AppColors.c_090F47),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          textAlign: TextAlign.center,
          "Choosing the Right Bank for Your Financial Goals",
          style: TextStyle(fontSize: 18.w, color: AppColors.c_090F47),
        ),
      ],
    );
  }
}
