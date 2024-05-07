import 'package:exson_bank/bloc/auth/auth_bloc.dart';
import 'package:exson_bank/bloc/auth/auth_state.dart';
import 'package:exson_bank/data/locol/storage_reposirory.dart';
import 'package:exson_bank/data/model/forma_stats.dart';
import 'package:exson_bank/screen/lokal_auth/methot_one/set_pin.dart';
import 'package:exson_bank/utils/colors/app_colors.dart';
import 'package:exson_bank/utils/images/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/user_profile/user_profile_bloc.dart';
import '../../bloc/user_profile/user_profile_event.dart';
import '../../utils/size/size.dart';
import '../auth_screens/register_screen.dart';
import '../on_bording/on_bording.dart';
import '../tab/tab_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   _init(bool isAuthenticated) async {
//     await Future.delayed(
//       const Duration(seconds: 2),
//     );
//     if (!mounted) return;
//
//
//     if (isAuthenticated == false) {
//       bool isNewUser = StorageRepository.getBool(key: "is_new_user");
//       if (isNewUser) {
//         Navigator.pushReplacementNamed(context, RouteNames.authRoute);
//       } else {
//         Navigator.pushReplacementNamed(context, RouteNames.onBoardingRoute);
//       }
//     } else {
//       Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//         body: BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//
//         if(state.formStatus == FormStatus.authenticated){
//             _init(true);
//         }else{
//           _init(false);
//         }
//       },
//       child: Column(
//         children: [
//           SizedBox(height: 150.h,),
//           Text(
//             "Exson Bank",
//             style: AppTextStyle.interBlack2,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
//             child: Image.asset(AppImages.exson_bank),
//           ),
//         ],
//       ),
//     ));
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init(bool isAuthenticated) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (!mounted) return;

    if (isAuthenticated == false) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      if (isNewUser) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PinScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.authenticated) {
            BlocProvider.of<UserProfileBloc>(context).add(
              GetCurrentUserEvent(
                uid: FirebaseAuth.instance.currentUser!.uid,
              ),
            );
            _init(true);
          } else {
            _init(false);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.exson_bank)),
            50.getH(),
            Center(
              child: Text(
                "Bank App",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 36.w,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
