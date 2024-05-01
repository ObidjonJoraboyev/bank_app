import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'data/local/storage_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDZaki7QUfcC-QJjUKCoscjmNw_sww85s8',
      authDomain: 'bank-project-d24dc.firebaseapp.com',
      projectId: 'bank-project-d24dc',
      storageBucket: 'bank-project-d24dc.appspot.com',
      messagingSenderId: '177296665595',
      appId: '1:177296665595:android:9350a8a8fac6399bcf795e',
      measurementId: '',
    ),
  );

  await StorageRepository.init();

  runApp(App());
}
