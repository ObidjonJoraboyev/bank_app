import 'package:banking_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:banking_app/blocs/user_profile/user_profile_state.dart';
import 'package:banking_app/screens/tab_box/profile/update/update_screen.dart';
import 'package:banking_app/screens/tab_box/profile/widgets/button_items.dart';
import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.fullscreen_exit,
                              size: 40.w,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      25.getH(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdateScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      21.getH(),
                      Text(
                        '${state.userModel.userName} ${state.userModel.lastName}',
                        style: TextStyle(
                          color: AppColors.c_151940,
                          fontSize: 30.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      5.getH(),
                      Text(
                        'account ending with 1545',
                        style: TextStyle(
                          color: AppColors.c_151940,
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                30.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonItems(
                      title: "Transfer",
                      onTap: () {},
                      icon: Icons.transfer_within_a_station,
                    ),
                    ButtonItems(
                      title: "Sent",
                      onTap: () {},
                      icon: Icons.person,
                    ),
                    ButtonItems(
                      title: "Shopping",
                      onTap: () {},
                      icon: Icons.shopping_bag_outlined,
                    ),
                    ButtonItems(
                      title: "Bill",
                      onTap: () {},
                      icon: Icons.save,
                    ),
                    ButtonItems(
                      title: "Vouchers",
                      onTap: () {},
                      icon: Icons.airplane_ticket_outlined,
                    ),
                  ],
                ),
                25.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.c_7A7AFE,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Salary",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20.w,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            3.getH(),
                            Text(
                              "\$255,500",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 30.w,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.c_5771F9,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Transfers",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20.w,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            3.getH(),
                            Text(
                              "\$255,500",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 30.w,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                39.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  child: Column(
                    children: [
                      Text(
                        "Recent transactions",
                        style: TextStyle(
                          color: AppColors.c_151940,
                          fontSize: 26.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ...List.generate(
                        4,
                        (index) => ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.money,
                            size: 30.w,
                          ),
                          title: Text(
                            "Behance Project",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 15.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "23 March 2023",
                            style: TextStyle(
                              color: AppColors.c_7F8192,
                              fontSize: 12.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            "\$320",
                            style: TextStyle(
                              color: AppColors.c_151940,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
