import 'package:banking_app/utils/app_colors.dart';
import 'package:banking_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ButtonItems extends StatelessWidget {
  const ButtonItems(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30.w,
          ),
          11.getH(),
          Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14.w,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
