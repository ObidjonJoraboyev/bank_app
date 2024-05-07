import 'package:exson_bank/utils/colors/app_colors.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/images/app_images.dart';


class BoardingPageTow extends StatelessWidget {
  const BoardingPageTow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.on_boarding_2),
        SizedBox(
          height: 20.h,
        ),
        Text(
          textAlign: TextAlign.center,
          "Your Financial Partner for Life: Citibank",
          style: TextStyle(fontSize: 25.w, color: AppColors.c_090F47),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          textAlign: TextAlign.center,
          "Where Your Financial Goals Become Reality",
          style: TextStyle(fontSize: 18.w, color: AppColors.c_090F47),
        ),
      ],
    );
  }
}
