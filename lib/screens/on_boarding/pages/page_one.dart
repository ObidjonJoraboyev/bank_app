import 'package:bank_app/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardingPageOne extends StatelessWidget {
  const BoardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/img_1.png",
              width: 320,
            )),
        const SizedBox(
          height: 90,
        ),
        Text(
          "The right relationship \nis everything.",
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
          "Your Trusted Partner in Financial Success",
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
