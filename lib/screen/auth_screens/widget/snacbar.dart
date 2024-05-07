import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2), // Snackbar ko'rsatiladigan vaqt
      backgroundColor: Colors.red, // Snackbar fon rangi
    ),
  );
}