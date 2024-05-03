import 'package:equatable/equatable.dart';

import '../../data/forms/form_status.dart';
import '../../data/models/user_model.dart';

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
