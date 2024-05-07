// import 'package:flutter/material.dart';
//
// import '../../../utils/styles/app_text_style.dart';
// import '../../routs.dart';
//
//
// class SetPinScreen extends StatefulWidget {
//   const SetPinScreen({Key? key}) : super(key: key);
//
//   @override
//   _SetPinScreenState createState() => _SetPinScreenState();
// }
//
// class _SetPinScreenState extends State<SetPinScreen> {
//   final TextEditingController pinPutController = TextEditingController();
//   final FocusNode focusNode = FocusNode();
//   bool isError = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: height / 6,
//             child: Text(
//               "Pin Kodni o'rnating!",
//               style: AppTextStyle.interSemiBold.copyWith(fontSize: 20),
//             ),
//           ),
//           SizedBox(height: 32),
//           SizedBox(
//             width: width / 2,
//             child: PinPutTextView(
//               isError: isError,
//               pinPutFocusNode: focusNode,
//               pinPutController: pinPutController,
//             ),
//           ),
//           SizedBox(height: 32),
//           CustomKeyboardView(
//             onFingerPrintTap: () {
//               // Implement biometric authentication
//             },
//             number: (number) {
//               if (pinPutController.text.length < 4) {
//                 setState(() {
//                   pinPutController.text = "${pinPutController.text}$number";
//                 });
//               }
//               if (pinPutController.text.length == 4) {
//                 Navigator.pushNamed(
//                   context,
//                   RouteNames.confirmPinRoute,
//                   arguments: pinPutController.text,
//                 );
//                 setState(() {
//                   pinPutController.text = "";
//                 });
//               }
//             },
//             isBiometricsEnabled: false,
//             onClearButtonTap: () {
//               if (pinPutController.text.length > 0) {
//                 setState(() {
//                   pinPutController.text = pinPutController.text.substring(0, pinPutController.text.length - 1);
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
import 'package:exson_bank/utils/images/app_images.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/colors/app_colors.dart';
import '../../tab/tab_screen.dart';
import '../local_auth.dart';
import 'cubit/passwor_cubit.dart';
import 'cubit/password_state.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  bool auth = false;

  _init() async {
    final authenticated = await LocalAuth.authenticate();
    setState(
      () {
        auth = authenticated;
      },
    );
    if (auth)  {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabScreen(),
        ),
      );
    }
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
          backgroundColor: AppColors.c_090F47,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () {
          context.read<PasswordCubit>().insertPassword(title, context);
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

    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                bottom: 600.h,
                right: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.c_090F47.withOpacity(0.4),
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
                            color: AppColors.c_090F47,
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
                            color: AppColors.c_090F47,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      25.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            4,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 12.w),
                              width: 15.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                color: index < state.password.length
                                    ? state.passwordStatus ==
                                            PasswordStatus.error
                                        ? Colors.red
                                        : Colors.green
                                    : AppColors.c_415A93.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
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
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.c_090F47,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  _init();
                                },
                                icon: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SvgPicture.asset(AppImages.finger,
                                         color: Colors.white))),
                          ),
                          buttonItems(title: "0"),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 22.w,
                                vertical: 22.h,
                              ),
                              backgroundColor: AppColors.c_090F47,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () {
                              context.read<PasswordCubit>().remove();
                            },
                            child: const Icon(
                              Icons.backspace,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
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
