import 'package:exson_bank/bloc/auth/auth_bloc.dart';
import 'package:exson_bank/bloc/auth/auth_event.dart';
import 'package:exson_bank/screen/routs.dart';
import 'package:exson_bank/screen/tab/plofiles/update/widget/text_filetI_tms.dart';
import 'package:exson_bank/utils/images/app_images.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/auth/auth_state.dart';
import '../../../../bloc/user_profile/user_profile_bloc.dart';
import '../../../../bloc/user_profile/user_profile_event.dart';
import '../../../../bloc/user_profile/user_profile_state.dart';
import '../../../../data/model/user_model.dart';
import '../../../../utils/colors/app_colors.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.getH(),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: AppColors.c_151940,
                      fontSize: 30.w,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  38.getH(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 120.w,
                      height: 120.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.w),
                        child: Image.asset(AppImages.person45),
                      ),
                    ),
                  ),
                  15.getH(),
                  Center(
                    child: Text(
                      "Change Profile Picture",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  9.getH(),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: AppColors.c_151940,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.getH(),
                  TextFieldItems(
                    hintText: state.userModel.phoneNumber,
                    controller: phoneController,
                  ),
                  12.getH(),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: AppColors.c_151940,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.getH(),
                  TextFieldItems(
                    hintText: state.userModel.password,
                    controller: passwordController,
                  ),
                  200.getH(),
                  // const Spacer(),

                  SizedBox(
                    width: 150.w,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 19.h),
                        backgroundColor: AppColors.c_304FFE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        if (phoneController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Phone and password have not been changed!",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        } else {
                          UserModel userModel = state.userModel;

                          userModel = userModel.copyWith(
                            phoneNumber: phoneController.text,
                            passwordName: passwordController.text,
                          );
                          context.read<UserProfileBloc>().add(
                                UpdateUserEvent(
                                  userModel: userModel,
                                ),
                              );
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Save changes",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.c_090F47),
                        borderRadius: BorderRadius.circular(10),
                        // color: AppColors.c_090F47.withOpacity(0.5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LogOutEvent());
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteNames.authRoute, (route) => false);
                          // Navigator.push(context,MaterialPageRoute(builder: (context){
                          //   return const SplashScreen();
                          // }));
                        },
                        child: const Text(
                          "Log Out",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  20.getH(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
