import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/locol/storage_reposirory.dart';
import '../../../tab/tab_screen.dart';

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
    }
  }
}