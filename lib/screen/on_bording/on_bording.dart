
import 'package:exson_bank/screen/auth_screens/widget/simple_global_button.dart';
import 'package:exson_bank/screen/on_bording/pages/boarding_pagas_one.dart';
import 'package:exson_bank/screen/on_bording/pages/boarding_pages_three.dart';
import 'package:exson_bank/screen/on_bording/pages/boarding_pages_tow.dart';
import 'package:exson_bank/screen/routs.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';


import '../../data/locol/storage_reposirory.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {},
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  BoardingPageOne(),
                  BoardingPageTow(),
                  BoardingPageThree(),
                ],
              ),
            ),
            SimpleGlobalButton(onTap: (){
              if (activeIndex == 2) {
                StorageRepository.setBool(
                  key: "is_new_user",
                  value: true,
                ).then(
                      (value) {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.authRoute);
                  },
                );
              } else {
                activeIndex += 1;
                controller.animateToPage(
                  activeIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
            }, title: "Next", horizontalPadding: 0, verticalPadding: 0)
          ],
        ),
      ),
    );
  }
}
