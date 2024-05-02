import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

abstract class AuthEvent extends Equatable {}

class CheckAuthenticationEvent extends AuthEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginUserEvent extends AuthEvent {
  final String userName;
  final String password;

  LoginUserEvent({
    required this.password,
    required this.userName,
  });

  @override
  List<Object?> get props => [userName, password];
}

class RegisterUserEvent extends AuthEvent {
  final UserModel userModel;
  RegisterUserEvent({
    required this.userModel,
  });
  @override
  List<Object?> get props => [userModel];
}

class LogoutUserEvent extends AuthEvent {
  final UserModel userModel;
  LogoutUserEvent({
    required this.userModel,
  });
  @override
  List<Object?> get props => [userModel];
}

class SignInWithGoogleEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
