import 'package:banking_app/blocs/auth/auth_bloc.dart';
import 'package:banking_app/blocs/auth/auth_event.dart';
import 'package:banking_app/blocs/card/user_card_bloc.dart';
import 'package:banking_app/blocs/card/user_card_event.dart';
import 'package:banking_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:banking_app/data/repository/auth_repository.dart';
import 'package:banking_app/data/repository/card_repository.dart';
import 'package:banking_app/data/repository/user_profile_repository.dart';
import 'package:banking_app/screens/pin/cubit/check_cubit.dart';
import 'package:banking_app/screens/pin/cubit/password_cubit.dart';
import 'package:banking_app/screens/routes.dart';
import 'package:banking_app/services/local_natification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => UserProfileRepository()),
        RepositoryProvider(create: (_) => CardRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>())
                  ..add(CheckAuthenticationEvent()),
          ),
          BlocProvider(
            create: (context) => UserProfileBloc(
                userProfileRepository: context.read<UserProfileRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                UserCardsBloc(cardRepository: context.read<CardRepository>())
                  ..add(GetCardsDatabaseEvent()),
          ),
          BlocProvider(create: (_) => PasswordCubit()),
          BlocProvider(create: (_) => CheckCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
