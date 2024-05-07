import 'package:banking_app/data/local/storage_repository.dart';
import 'package:banking_app/screens/auth/register/register_screen.dart';
import 'package:banking_app/screens/on_boarding/widgets/on_boarding_items.dart';
import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(
                  images.length,
                  (index) => OnBoardingItems(
                    image: images[index],
                    text: texts[index],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 30.h,
            ),
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.c_262626,
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (activeIndex == 2) {
                  StorageRepository.setBool(
                    key: "is_new_user",
                    value: true,
                  ).then(
                    (value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
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
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
