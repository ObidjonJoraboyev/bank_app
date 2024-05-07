import 'package:banking_app/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {}

class AddUserEvent extends UserProfileEvent {
  AddUserEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class UpdateUserEvent extends UserProfileEvent {
  UpdateUserEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class DeleteUserEvent extends UserProfileEvent {
  DeleteUserEvent({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class GetUserByDocIdEvent extends UserProfileEvent {
  GetUserByDocIdEvent({required this.docId});

  final String docId;

  @override
  List<Object?> get props => [docId];
}

class GetCurrentUserEvent extends UserProfileEvent {
  GetCurrentUserEvent({required this.uid});

  final String uid;

  @override
  List<Object?> get props => [uid];
}
