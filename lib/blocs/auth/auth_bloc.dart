import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/forms/form_status.dart';
import '../../data/models/network_response.dart';
import '../../data/repository/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(
          const AuthState(
            status: FormStatus.pure,
            errorMessage: "",
            statusMessage: "",
          ),
        ) {
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<LogoutUserEvent>(_logOutUser);
    on<SignInWithGoogleEvent>(_googleSignIn);
  }

  final AuthRepository authRepository;

  _checkAuthentication(CheckAuthenticationEvent event, emit) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(state.copyWith(
        status: FormStatus.unauthenticated,
      ));
    } else {
      emit(state.copyWith(status: FormStatus.authenticated));
    }
  }

  _loginUser(LoginUserEvent event, emit) async {
    NetworkResponse networkResponse =
        await authRepository.loginWithEmailAndPassword(
      email: "${event.userName}@gmail.com",
      password: event.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.authenticated,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    NetworkResponse networkResponse =
        await authRepository.registerWithEmailAndPassword(
      email: "${event.userModel.username}@gmail.com",
      password: event.userModel.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.authenticated,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  _logOutUser(LogoutUserEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    NetworkResponse networkResponse = await authRepository.logOutUser();

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.unauthenticated,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  _googleSignIn(SignInWithGoogleEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    NetworkResponse networkResponse = await authRepository.googleSignIn();
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.authenticated,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }
}
