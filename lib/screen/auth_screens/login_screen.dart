import 'package:exson_bank/data/model/forma_stats.dart';
import 'package:exson_bank/screen/auth_screens/register_screen.dart';
import 'package:exson_bank/screen/auth_screens/widget/my_custom_buttom/my_custom_button.dart';
import 'package:exson_bank/screen/auth_screens/widget/password_text_input.dart';
import 'package:exson_bank/screen/auth_screens/widget/simple_global_button.dart';
import 'package:exson_bank/screen/auth_screens/widget/universal_text_input.dart';
import 'package:exson_bank/screen/routs.dart';
import 'package:exson_bank/utils/colors/app_colors.dart';
import 'package:exson_bank/utils/constants/app_constants.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../data/model/user_model.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../tab/tab_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;

  bool isValidLoginCredentionls() =>
      AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
      AppConstants.textRegExp.hasMatch(emailController.text);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
                    child: Image.asset(AppImages.exson_bank),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Welcome Back!",
                            style: AppTextStyle.rubikSemiBold.copyWith(
                              color: AppColors.c_2C2C73,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          UniversalTextField(
                            onChanged: (v) {
                              setState(() {});
                            },
                            errorText: "Mailni to'g'ri  kiriting!",
                            regExp: RegExp("[a-zA-Z]"),
                            controller: emailController,
                            iconPath: AppImages.sms,
                            hintText: "Mail",
                            type: TextInputType.text,
                          ),
                          SizedBox(height: 16.h),
                          PasswordTextField(
                            controller: passwordController,
                            iconPath: AppImages.log,
                            isVisible: passwordVisibility,
                            suffix: IconButton(
                              onPressed: () {
                                passwordVisibility = !passwordVisibility;
                                setState(() {});
                              },
                              icon: Icon(
                                passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              splashRadius: 20,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          // SimpleGlobalButton(
                          //   onTap: () {
                          //     context.read<AuthBloc>().add(
                          //       AuthLoginEvent(
                          //         email: emailController.text,
                          //         password: passwordController.text,
                          //       ),
                          //     );
                          //   },
                          //   title: "LOGIN",
                          //   horizontalPadding: 0,
                          //   verticalPadding: 0,
                          // ),
                          MyCustomButton(
                            onTap: () {

                              context.read<AuthBloc>().add(
                                LoginUserEvent(
                                  username: emailController.text,
                                  password: passwordController.text,
                                ),
                              );

                            },
                            readyToSubmit: isValidLoginCredentionls(),
                            isLoading: state.formStatus == FormStatus.loading,
                            title: "Log In",
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(SignInWithGoogleEvent(userModel:  UserModel.initial()));
                                },
                                icon: SvgPicture.asset(AppImages.google),
                              ),
                              const Text("Register with Google"),
                              const Spacer()

                              // const Spacer(),
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: SvgPicture.asset(AppImages.fasebook),
                              // ),
                              // const Spacer(),
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: SvgPicture.asset(AppImages.iphone),
                              // ),
                              // const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen();
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 12,
                          color: AppColors.c_29BB89.withOpacity(0.45),
                        ),
                        SizedBox(width: 8.h),
                        Text(
                          "Don’t have an account? Sign Up",
                          style: AppTextStyle.rubikSemiBold.copyWith(
                            fontSize: 14,
                            color: AppColors.c_2C2C73.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state.formStatus == FormStatus.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const TabScreen(),
            //   ),
            // );
          }

          if (state.formStatus == FormStatus.authenticated) {
            if (state.statusMessage == "registered") {
              //TODU USER MALUMOTLARI
              //state.userModel
            }
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.tabRoute, (route) => false);
          }
        },
      ),
    );
  }
}
