import 'package:bank_app/screens/on_boarding/pages/page_one.dart';
import 'package:bank_app/screens/on_boarding/pages/page_three.dart';
import 'package:bank_app/screens/on_boarding/pages/page_two.dart';
import 'package:flutter/material.dart';
import '../../data/local/storage_repo.dart';
import '../routes.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: activeIndex != 0,
                child: TextButton(
                  onPressed: () {
                    if (activeIndex > 0) {
                      activeIndex -= 1;
                      setState(() {});
                      controller.animateToPage(
                        activeIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: const Text(
                    "BACK",
                    style: TextStyle(
                        color: Color(0xff151940),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNames.authRoute);
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(
                      color: Color(0xff151940),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 1),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                BoardingPageOne(),
                BoardingPageTwo(),
                BoardingPageThree(),
              ],
            ),
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${activeIndex + 1} / 3",
                  style: const TextStyle(
                      color: Color(0xff151940),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 180,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 45),
                  child: GestureDetector(
                    onTap: () {
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
                        setState(() {});
                        controller.animateToPage(
                          activeIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff151940)),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
