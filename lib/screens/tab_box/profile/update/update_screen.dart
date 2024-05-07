import 'package:banking_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:banking_app/blocs/user_profile/user_profile_event.dart';
import 'package:banking_app/blocs/user_profile/user_profile_state.dart';
import 'package:banking_app/data/models/user_model.dart';
import 'package:banking_app/screens/tab_box/profile/update/widgets/textfield_items.dart';
import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 120.w,
                    height: 120.h,
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
                  hintText: state.userModel.passwordName,
                  controller: passwordController,
                ),
                8.getH(),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
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
                20.getH(),
              ],
            ),
          );
        },
      ),
    );
  }
}
