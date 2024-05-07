import 'package:banking_app/blocs/auth/auth_bloc.dart';
import 'package:banking_app/blocs/auth/auth_state.dart';
import 'package:banking_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:banking_app/blocs/user_profile/user_profile_event.dart';
import 'package:banking_app/data/local/storage_repository.dart';
import 'package:banking_app/screens/auth/register/register_screen.dart';
import 'package:banking_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:banking_app/screens/pin/set_entry_screen.dart';
import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/app_images.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (context) => const EnterScreen(),
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
            Center(child: Image.asset(AppImages.bankImage)),
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
