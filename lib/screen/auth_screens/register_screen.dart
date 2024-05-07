import 'package:exson_bank/bloc/user_profile/user_profile_bloc.dart';
import 'package:exson_bank/bloc/user_profile/user_profile_event.dart';
import 'package:exson_bank/data/model/user_model.dart';
import 'package:exson_bank/screen/auth_screens/widget/my_custom_buttom/my_custom_button.dart';
import 'package:exson_bank/screen/auth_screens/widget/password_text_input.dart';
import 'package:exson_bank/screen/auth_screens/widget/universal_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../data/model/forma_stats.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/images/app_images.dart';
import '../../utils/size/size.dart';
import '../../utils/styles/app_text_style.dart';
import '../lokal_auth/methot_one/set_pin.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // final TextEditingController usernameController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController lastNameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController firstNameController = TextEditingController();

  UserModel userModel = UserModel.initial();
  bool passwordVisibility = false;



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


  bool isValidLoginCredentials() =>
      AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
      AppConstants.phoneRegExp.hasMatch(phoneController.text) &&
      AppConstants.textRegExp.hasMatch(lastNameController.text);

  bool isValidLoginCredentionls() =>
      AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
      AppConstants.textRegExp.hasMatch(firstNameController.text);



  final picker = ImagePicker();
  String storagePath = "";
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50.w, vertical: 50.h),
                            child: Image.asset(AppImages.exson_bank),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          const Text(
                              textAlign: TextAlign.center,
                              "Create your account!",
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.c_2C2C73,
                              )),
                          SizedBox(height: 24.h),
                          UniversalTextField(
                            labelText: "Your name",
                            errorText: "Ismni to'g'ri  kiriting!",
                            regExp: AppConstants.textRegExp,
                            controller: lastNameController,
                            iconPath: AppImages.person35,
                            hintText: "Your Name",
                            type: TextInputType.text,
                          ),
                          SizedBox(height: 8.h),
                          UniversalTextField(
                            errorText: "Emailni to'g'ri  kiriting!",
                            regExp: AppConstants.textRegExp,
                            controller: firstNameController,
                            iconPath: AppImages.sms,
                            hintText: "Email",
                            type: TextInputType.emailAddress,
                          ),
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
                          MyCustomButton(
                            onTap: () {
                              context.read<AuthBloc>().add(
                                    RegisterUserEvent(
                                      userModel: UserModel(
                                        imageUrl: "",
                                        email:
                                            "${firstNameController.text.toLowerCase()}@gmail.com",
                                        lastName: lastNameController.text,
                                        password: passwordController.text,
                                        phoneNumber: phoneController.text,
                                        userId: "",
                                        userName: firstNameController.text,
                                        fcm: "",
                                        authUid: "",
                                      ),
                                    ),
                                  );
                            },
                            readyToSubmit: isValidLoginCredentionls(),
                            isLoading: state.formStatus == FormStatus.loading,
                            title: 'REGISTER',
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                      SignInWithGoogleEvent(
                                          userModel: UserModel.initial()));
                                },
                                icon: SvgPicture.asset(AppImages.google),
                              ),
                              const Text("Register with Google"),
                              const Spacer()
                            ],
                          ),
                        ],
                      ),
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
                          "Already have an account? Login",
                          style: AppTextStyle.rubikSemiBold.copyWith(
                              fontSize: 14, color: AppColors.c_2C2C73),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        // listener: (BuildContext context, AuthState state) {
        //   if (state.formStatus == FormStatus.authenticated) {
        //     if (state.statusMessage == "registered") {
        //       context.read<UserProfileBloc>().add(
        //         AddUserEvent(
        //           userModel: state.userModel,
        //         ),
        //       );
        //     }
        //     BlocProvider.of<UserProfileBloc>(context).add(
        //       GetCurrentUserEvent(
        //         uid: FirebaseAuth.instance.currentUser!.uid,
        //       ),
        //     );
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const TabScreen(),
        //       ),
        //     );
        //   }
        // },
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
    );
  }
}
