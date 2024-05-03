import 'package:bank_app/blocs/auth/auth_bloc.dart';
import 'package:bank_app/blocs/auth/auth_event.dart';
import 'package:bank_app/blocs/auth/auth_state.dart';
import 'package:bank_app/screens/routes.dart';
import 'package:bank_app/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/forms/form_status.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/images/app_images.dart';
import '../register/register_screen.dart';
import '../widgets/button.dart';
import '../widgets/global_textfield.dart';
import '../widgets/textfielad.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isChecked = false;

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.black,
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.formStatus == FormStatus.error) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if (state.formStatus == FormStatus.unauthenticated) {
              return Column(
                children: [
                  60.getH(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44.w),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Image.asset(
                                AppImages.registerImage,
                                height: 250.h,
                                width: 225.w,
                                fit: BoxFit.cover,
                              ),
                              16.getH(),
                              Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 22.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              16.getH(),
                              UniversalTextInput(
                                controller: emailController,
                                hintText: "Email",
                                type: TextInputType.text,
                                regExp: AppConstants.textRegExp,
                                errorTitle: 'Email error',
                                iconPath: AppImages.email,
                              ),
                              16.getH(),
                              PasswordTextInput(
                                controller: passwordController,
                              ),
                              35.getH(),
                              LoginButtonItems(
                                onTap: () {
                                  context.read<AuthBloc>().add(
                                        LoginUserEvent(
                                          username: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                },
                                isLoading:
                                    state.formStatus == FormStatus.loading,
                                active: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: AppColors.white.withOpacity(.8),
                          fontSize: 12.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.getH(),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          listener: (BuildContext context, AuthState state) {
            if (state.formStatus == FormStatus.authenticated) {
              Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
            }
          },
        ),
      ),
    );
  }

  bool get checkInput {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(emailController.text);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
