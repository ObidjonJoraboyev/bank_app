
import 'package:exson_bank/bloc/user_profile/user_profile_event.dart';
import 'package:exson_bank/bloc/user_profile/user_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/forma_stats.dart';
import '../../data/model/network_respons.dart';
import '../../data/model/user_model.dart';
import '../../data/repositories/user_profil_repository.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required this.userProfileRepository})
      : super(UserProfileState(
    userModel: UserModel.initial(),
    formStatus: FormStatus.pure,
    errorMessage: "",
    statusMessage: "",
  )) {
    on<AddUserEvent>(_addUser);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
    on<GetUserByDocIdEvent>(_getUserByDocId);
    on<GetCurrentUserEvent>(_getUser);
  }

  final UserProfileRepository userProfileRepository;

  _addUser(AddUserEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.addUser(event.userModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          userModel: event.userModel,
        ),
      );
    } else {
      emit(state.copyWith(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _updateUser(UpdateUserEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.updateUser(event.userModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          userModel: event.userModel,
        ),
      );
    } else {
      emit(state.copyWith(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _deleteUser(DeleteUserEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.deleteUser(event.userModel.userId);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          userModel: UserModel.initial(),
        ),
      );
    } else {
      emit(state.copyWith(
        statusMessage: networkResponse.errorCode,
        formStatus: FormStatus.error,
      ));
    }
  }

  _getUserByDocId(GetUserByDocIdEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.getUserByDocId(event.docId);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          userModel: networkResponse.data as UserModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusMessage: networkResponse.errorCode,
          formStatus: FormStatus.error,
        ),
      );
    }
  }

  _getUser(GetCurrentUserEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.getUserByUid(event.uid);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          userModel: networkResponse.data as UserModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusMessage: networkResponse.errorCode,
          formStatus: FormStatus.error,
        ),
      );
    }
  }
}