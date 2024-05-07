// abstract class AuthState {}
//
// class AuthInitialState extends AuthState {}
//
// class AuthLoadingState extends AuthState {}
//
// class AuthSuccessState extends AuthState {}
//
// class AuthErrorState extends AuthState {
//   AuthErrorState({required this.errorText});
//
//   final String errorText;
// }

import 'package:equatable/equatable.dart';
import 'package:exson_bank/data/model/forma_stats.dart';
import 'package:exson_bank/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class AuthState extends Equatable {
//   final String errorMessage;
//   final String statusMessage;
//   final FormStatus formStatus;
//   final UserModel userModel;
//
//
//   const AuthState(
//       {required this.userModel, required this.errorMessage, required this.statusMessage, required this.formStatus});
//
//
//   AuthState copyWith(
//       {UserModel? userModel, String? errorMessage, String? statusMessage, FormStatus? formStatus}) {
//     return AuthState(
//       errorMessage: errorMessage ?? this.errorMessage,
//       statusMessage: statusMessage ?? this.statusMessage,
//       formStatus: formStatus ?? this.formStatus,
//       userModel: userModel ?? this.userModel,
//
//     );
//   }
//
//   @override
//   List<Object?> get props => [errorMessage, statusMessage, formStatus,userModel];
// }
class AuthState extends Equatable {
  const AuthState(
      {required this.errorMessage,
        required this.statusMessage,
        required this.formStatus,
        required this.userModel});

  final String errorMessage;
  final String statusMessage;
  final FormStatus formStatus;
  final UserModel userModel;

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? formStatus,
    UserModel? userModel,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
      formStatus: formStatus ?? this.formStatus,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props =>
      [errorMessage, statusMessage, formStatus, userModel];
}


