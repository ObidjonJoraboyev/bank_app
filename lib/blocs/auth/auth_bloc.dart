import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_app/blocs/auth/auth_state.dart';
import '../../data/forms/form_status.dart';
import '../../data/models/network_response.dart';
import '../../data/models/user_model.dart';
import '../../data/repository/auth_repo.dart';
import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository})
      : super(
          AuthState(
            errorMessage: "",
            statusMessage: "",
            formStatus: FormStatus.pure,
            userModel: UserModel.initial(),
          ),
        ) {
    on<LoginUserEvent>(_loginUser);
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LogOutEvent>(_logOutUser);
    on<RegisterUserEvent>(_registerUser);
    on<SignInWithGoogleEvent>(_googleSigIn);
  }

  Future<void> _loginUser(LoginUserEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await authRepository.loginWithEmailAndPassword(
      email: "${event.username}@gmail.com",
      password: event.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(formStatus: FormStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  _checkAuthentication(CheckAuthenticationEvent event, emit) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(state.copyWith(formStatus: FormStatus.unauthenticated));
    } else {
      emit(state.copyWith(formStatus: FormStatus.authenticated));
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await authRepository.registerWithEmailAndPassword(
      username: "${event.userModel.userName}@gmail.com",
      password: event.userModel.passwordName,
    );

    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data as UserCredential;

      UserModel userModel =
          event.userModel.copyWith(authUid: userCredential.user!.uid);
      emit(
        state.copyWith(
          formStatus: FormStatus.authenticated,
          statusMessage: "registered",
          userModel: userModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  _logOutUser(LogOutEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await authRepository.logOutUser();

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(formStatus: FormStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  _googleSigIn(SignInWithGoogleEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    NetworkResponse networkResponse = await authRepository.logOutUser();

    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data;
      emit(
        state.copyWith(
          formStatus: FormStatus.authenticated,
          userModel: UserModel(
            imageUrl: userCredential.user!.photoURL ?? "",
            email: userCredential.user!.email ?? "",
            userName: userCredential.user!.displayName ?? "",
            lastName: userCredential.user!.displayName ?? "",
            passwordName: "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            userId: "",
            fcm: "",
            authUid: userCredential.user!.uid,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }
}
