import 'package:banking_app/screens/pin/cubit/password_state.dart';
import 'package:banking_app/screens/pin/set_entry_screen.dart';
import 'package:banking_app/screens/tab_box/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/storage_repository.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit()
      : super(PasswordState(
          password: "",
          passwordStatus: PasswordStatus.newPassword,
        ));

  remove() {
    if (state.password.isNotEmpty) {
      emit(state.copyWithPassword(
          password: state.password.substring(0, state.password.length - 1)));
    } else {
      emit(state.copyWithPassword(isTruePassword: false));
    }
  }

  Future<void> insertPassword(String password, BuildContext context) async {
    if (state.password.length < 3) {
      emit(state.copyWithPassword(password: state.password + password));
    } else {
      emit(state.copyWithPassword(password: state.password + password));
      if (StorageRepository.getBool(key: "saved")) {
        emit(state.copyWithPassword(
            passwordStatus:
                StorageRepository.getString(key: "pin_code") == state.password
                    ? PasswordStatus.ok
                    : PasswordStatus.error));
        isTruePassword(context);
      } else {
        StorageRepository.setBool(key: "saved", value: true);
        StorageRepository.setString(key: "pin_code", value: state.password);
        emit(state.copyWithPassword(password: ""));
        isTruePassword(context);
      }
    }
  }

  isTruePassword(BuildContext context) {
    if (state.passwordStatus == PasswordStatus.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
          content: Text("Notogri parol kiritdingiz!"),
        ),
      );
      if (isStartAnimation) {
        globalAnimationController.reverse();
        isStartAnimation = false;
      } else {
        globalAnimationController.forward();
        isStartAnimation = true;
      }
      emit(state.copyWithPassword(isTruePassword: true));
    } else if (state.passwordStatus == PasswordStatus.ok) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
          content: Text("Parolni qaytadan kiriting!"),
        ),
      );
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
