import 'package:flutter/material.dart';

import '../../../utils/styles/app_text_style.dart';

class BoardingPageTwo extends StatelessWidget {
  const BoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/img_2.png",
              width: 320,
            )),
        const SizedBox(
          height: 90,
        ),
        Text(
          "Your Financial Partner for Life:\n Citibank",
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
          "Where Your Financial Goals Become Reality",
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
