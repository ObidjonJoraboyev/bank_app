import 'package:equatable/equatable.dart';

import '../../data/forms/form_status.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormStatus status;

  const AuthState({
    required this.errorMessage,
    required this.statusMessage,
    required this.status,
  });

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? status,
  }) {
    return AuthState(
        errorMessage: errorMessage ?? this.errorMessage,
        statusMessage: statusMessage ?? this.statusMessage,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [
        status,
        statusMessage,
        errorMessage,
      ];
}
