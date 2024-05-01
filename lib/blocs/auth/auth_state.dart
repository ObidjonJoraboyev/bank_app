import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
