import 'package:banking_app/data/models/network_response.dart';
import 'package:banking_app/firebase%20_eception/firebase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  Future<NetworkResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
        errorCode: e.code,
      );
    } catch (error) {
      return NetworkResponse(
          errorText: "An unknown exception occurred: $error");
    }
  }

  Future<NetworkResponse> registerWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: SignUpWithEmailAndPasswordFailure.fromCode(e.code).message,
        errorCode: e.code,
      );
    } catch (error) {
      return NetworkResponse(
          errorText: "An unknown exception occurred: $error");
    }
  }

  Future<NetworkResponse> googleSignIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return NetworkResponse(data: userCredential);
      } else {
        return NetworkResponse(
            errorText: "Google Sign-In Failed: No user selected");
      }
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: "Login with Google Failure: ${e.message}",
      );
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }

  Future<NetworkResponse> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: "Sign Out Error: ${e.message}", errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }
}
