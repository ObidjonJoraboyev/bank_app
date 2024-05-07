import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class OnBoardingItems extends StatelessWidget {
  const OnBoardingItems({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Image.asset(image),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        30.getH(),
      ],
    );
  }
}

List<String> images = [AppImages.img1, AppImages.img2, AppImages.img3];
List<String> texts = [
  "The right relationship is everything.",
  "Your Financial Partner for Life: Citibank",
  "SYour Comprehensive Resource for Financial Success"
];
