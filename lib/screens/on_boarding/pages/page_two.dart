import 'package:flutter/material.dart';

import '../../../utils/images/app_images.dart';

class BoardingPageTwo extends StatelessWidget {
  const BoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.boy),
      ],
    );
  }
}