import 'package:banking_app/data/local/storage_repository.dart';
import 'package:banking_app/screens/pin/set_entry_screen.dart';
import 'package:banking_app/screens/tab_box/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckCubit extends Cubit<String> {
  CheckCubit() : super("");

  void createPassword(String pinCode) {
    StorageRepository.setString(
      key: "pin_code",
      value: pinCode,
    );
  }

  void toVerifyPinCode(String againPinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == againPinCode) {
      StorageRepository.setBool(
        key: "saved",
        value: true,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TabScreen(),
        ),
      );
    } else {
      StorageRepository.setBool(
        key: "saved",
        value: false,
      );
    }
  }

  void toCheckPinCode(String pinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == pinCode) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabScreen(),
        ),
      );
    } else {
      if (isStartAnimation) {
        globalAnimationController.reverse();
        isStartAnimation = false;
      } else {
        globalAnimationController.forward();
        isStartAnimation = true;
      }
    }
  }
}
