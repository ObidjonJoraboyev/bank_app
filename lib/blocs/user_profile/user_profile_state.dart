import 'package:banking_app/blocs/auth/auth_state.dart';
import 'package:banking_app/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserProfileState extends Equatable {
  const UserProfileState(
      {required this.userModel,
      required this.formStatus,
      required this.errorMessage,
      required this.statusMessage});

  final UserModel userModel;
  final FormStatus formStatus;
  final String errorMessage;
  final String statusMessage;

  UserProfileState copyWith({
    UserModel? userModel,
    FormStatus? formStatus,
    String? errorMessage,
    String? statusMessage,
  }) {
    return UserProfileState(
      userModel: userModel ?? this.userModel,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [
        userModel,
        formStatus,
        errorMessage,
        statusMessage,
      ];
}
