import 'package:banking_app/screens/pin/cubit/check_cubit.dart';
import 'package:banking_app/screens/pin/local_auth.dart';
import 'package:banking_app/screens/tab_box/tab_screen.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen>
    with SingleTickerProviderStateMixin {
  String pinCode = "";
  late Animation<Alignment> animationAlign;

  bool auth = false;

  _init() async {
    final authenticated = await LocalAuth.authenticate();
    setState(() {
      auth = authenticated;
    });
    if (auth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    globalAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animationAlign = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
          weight: 40),
    ]).animate(CurvedAnimation(
        parent: globalAnimationController, curve: Curves.decelerate));

    globalAnimationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Widget buttonItems({required String title}) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 33.w,
            vertical: 25.h,
          ),
          backgroundColor: Colors.white10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () {
          pinCode += title;
          if (pinCode.length == 4) {
            context.read<CheckCubit>().toCheckPinCode(pinCode, context);
            pinCode = "";
          }
          setState(() {});
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.w,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return BlocBuilder<CheckCubit, String>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned(
                top: 100,
                left: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.4),
                          spreadRadius: 40,
                          blurRadius: 100)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.purple.withOpacity(0.4),
                          spreadRadius: 60,
                          blurRadius: 100)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 150,
                right: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.withOpacity(0.4),
                          spreadRadius: 40,
                          blurRadius: 100)
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      70.getH(),
                      Center(
                        child: Text(
                          "Security screen",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.w,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      50.getH(),
                      Center(
                        child: Text(
                          "Enter your passcode",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      25.getH(),
                      Align(
                        alignment: animationAlign.value,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              4,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                width: 15.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  color: index < pinCode.length
                                      ? Colors.green
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      80.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttonItems(title: "1"),
                          buttonItems(title: "2"),
                          buttonItems(title: "3"),
                        ],
                      ),
                      15.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttonItems(title: "4"),
                          buttonItems(title: "5"),
                          buttonItems(title: "6"),
                        ],
                      ),
                      15.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttonItems(title: "7"),
                          buttonItems(title: "8"),
                          buttonItems(title: "9"),
                        ],
                      ),
                      15.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 25.h,
                                horizontal: 25.w,
                              ),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () {
                              _init();
                            },
                            child: Icon(
                              Icons.fingerprint,
                              size: 40.w,
                              color: Colors.white,
                            ),
                          ),
                          buttonItems(title: "0"),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 22.w,
                                vertical: 22.h,
                              ),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () {
                              if (pinCode.isEmpty) {
                                pinCode = "";
                              } else {
                                pinCode =
                                    pinCode.substring(0, pinCode.length - 1);
                              }
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.backspace,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      50.getH(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

late AnimationController globalAnimationController;
bool isStartAnimation = false;
