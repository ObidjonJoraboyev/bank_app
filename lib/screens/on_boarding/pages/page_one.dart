import 'package:flutter/material.dart';

import '../../../utils/images/app_images.dart';

class BoardingPageOne extends StatelessWidget {
  const BoardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.boy),
      ],
    );
  }
}
