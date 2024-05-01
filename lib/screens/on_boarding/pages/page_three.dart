import 'package:flutter/material.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class BoardingPageThree extends StatelessWidget {
  const BoardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/img_3.png",
              width: 320,
            )),
        const SizedBox(
          height: 90,
        ),
        Text(
          "Your Comprehensive Resource\nfor Financial Success",
          style: AppTextStyle.interBold.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xff151940),
              fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Choosing the Right Bank for Your Financial Goals",
          style: AppTextStyle.interBold.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff151940),
              fontSize: 18),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
