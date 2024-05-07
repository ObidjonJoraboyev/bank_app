
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';

class BoardingPageOne extends StatelessWidget {
  const BoardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.on_boarding_1),
          SizedBox(
            height: 20.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "The right relationship is everything.",
            style: TextStyle(fontSize: 25.w, color: AppColors.c_090F47),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Your Trusted Partner in Financial Success",
            style: TextStyle(fontSize: 18.w, color: AppColors.c_090F47),
          ),
        ],
      ),
    );
  }
}
