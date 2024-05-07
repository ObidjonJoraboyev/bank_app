
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

class ConnectivityState extends Equatable {
  const ConnectivityState({
    required this.connectivityResult,
    required this.hasInternet,
  });

  final ConnectivityResult connectivityResult;
  final bool hasInternet;

  ConnectivityState copyWith({
    ConnectivityResult? connectivityResult,
    bool? hasInternet,
  }) {
    return ConnectivityState(
      connectivityResult: connectivityResult ?? this.connectivityResult,
      hasInternet: hasInternet ?? this.hasInternet,
    );
  }

  @override
  List<Object> get props => [
    connectivityResult,
    hasInternet,
  ];
}

// Future<void> signInWithGoogle(BuildContext context,
//     [String? clientId]) async {
//   // Trigger the authentication flow
//   _notify(true);
//
//   final GoogleSignInAccount? googleUser =
//   await GoogleSignIn(clientId: clientId).signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//   await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   UserCredential userCredential =
//   await FirebaseAuth.instance.signInWithCredential(credential);
//   _notify(false);
//   if (userCredential.user != null) {
//     Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
//   }
// }