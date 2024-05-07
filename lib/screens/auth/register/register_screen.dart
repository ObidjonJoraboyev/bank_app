import 'package:banking_app/blocs/auth/auth_bloc.dart';
import 'package:banking_app/blocs/auth/auth_event.dart';
import 'package:banking_app/blocs/auth/auth_state.dart';
import 'package:banking_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:banking_app/blocs/user_profile/user_profile_event.dart';
import 'package:banking_app/data/models/user_model.dart';
import 'package:banking_app/screens/auth/login/login_screen.dart';
import 'package:banking_app/screens/auth/widgets/login_button.dart';
import 'package:banking_app/screens/auth/widgets/password_text_input.dart';
import 'package:banking_app/screens/auth/widgets/universal_text_input.dart';
import 'package:banking_app/screens/pin/set_pin_screen.dart';
import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/app_constants.dart';
import 'package:banking_app/utils/app_images.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isChecked = false;

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.formStatus == FormStatus.error) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 20, color: AppColors.white),
                ),
              );
            }
            if (state.formStatus == FormStatus.unauthenticated) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // 60.getH(),
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
                          controller: firstNameController,
                          hintText: "First Name",
                          type: TextInputType.text,
                          regExp: AppConstants.textRegExp,
                          errorTitle: 'First Name',
                          iconPath: AppImages.email,
                        ),
                        16.getH(),
                        UniversalTextInput(
                          controller: lastNameController,
                          hintText: "Last Name",
                          type: TextInputType.text,
                          regExp: AppConstants.textRegExp,
                          errorTitle: 'Last Name',
                          iconPath: AppImages.email,
                        ),
                        16.getH(),
                        UniversalTextInput(
                          controller: phoneController,
                          hintText: "Phone Number",
                          type: TextInputType.number,
                          regExp: AppConstants.phoneRegExp,
                          errorTitle: 'Phone Number',
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
                                  RegisterUserEvent(
                                    userModel: UserModel(
                                      imageUrl: "",
                                      email:
                                          "${firstNameController.text.toLowerCase()}@gmail.com",
                                      lastName: lastNameController.text,
                                      passwordName: passwordController.text,
                                      phoneNumber: phoneController.text,
                                      userId: "",
                                      userName: firstNameController.text,
                                      fcm: "",
                                      authUid: "",
                                    ),
                                  ),
                                );
                          },
                          isLoading: state.formStatus == FormStatus.loading,
                          active: checkInput,
                        ),
                        13.getH(),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: AppColors.white.withOpacity(.8),
                            fontSize: 13.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        6.getH(),
                        Text(
                          "Login in with",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        19.getH(),
                        IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignInWithGoogleEvent(
                                    userModel: UserModel.initial(),
                                  ),
                                );
                          },
                          icon: SvgPicture.asset(AppImages.google),
                        ),
                        19.getH(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
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
                                      return const LoginScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.w,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          listener: (BuildContext context, AuthState state) {
            if (state.formStatus == FormStatus.authenticated) {
              if (state.statusMessage == "registered") {
                context.read<UserProfileBloc>().add(
                      AddUserEvent(
                        userModel: state.userModel,
                      ),
                    );
              }
              BlocProvider.of<UserProfileBloc>(context).add(
                GetCurrentUserEvent(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PinScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  bool get checkInput {
    return AppConstants.textRegExp.hasMatch(firstNameController.text) &&
        AppConstants.passwordRegExp.hasMatch(passwordController.text);
  }

  @override
  void dispose() {
    passwordController.dispose();
    firstNameController.dispose();
    phoneController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
