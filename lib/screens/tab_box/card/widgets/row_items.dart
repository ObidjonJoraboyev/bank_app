import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowItems extends StatelessWidget {
  const RowItems(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF23265A),
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 21.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onTap,
          child: SvgPicture.asset(icon),
        ),
        12.getH(),
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12.w,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
