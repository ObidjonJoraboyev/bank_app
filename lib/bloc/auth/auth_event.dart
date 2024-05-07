

import 'package:equatable/equatable.dart';
import 'package:exson_bank/data/model/user_model.dart';
//
// abstract class AuthEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class CheckAuthenticationEvent extends AuthEvent {
//   @override
//   List<Object?> get props => [];
// }
//
// class LoginUserEvent extends AuthEvent {
//   final String username;
//   final String password;
//
//   LoginUserEvent({required this.password, required this.username});
//
//   @override
//   List<Object?> get props => [
//         password,
//         username,
//       ];
// }
//
// class RegisterUserEvent extends AuthEvent {
//   final UserModel userModel;
//
//   RegisterUserEvent({
//     required this.userModel,
//   });
//
//   @override
//   List<Object?> get props => [
//         userModel,
//       ];
// }
//
// class LogOutUserEvent extends AuthEvent {
//   @override
//   List<Object?> get props => [];
// }
//
// class SigInWithGoogleEvent extends AuthEvent {
//   @override
//   List<Object?> get props => [];
// }


abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends AuthEvent {
  LoginUserEvent({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class RegisterUserEvent extends AuthEvent {
  RegisterUserEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class LogOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignInWithGoogleEvent extends AuthEvent {
  SignInWithGoogleEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [];
}

