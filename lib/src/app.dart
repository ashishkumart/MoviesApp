import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/authentication/authentication.dart';
import 'package:movies_app/src/common/common.dart';
import 'package:movies_app/src/dashboard/dashboard_page.dart';
import 'package:movies_app/src/login/login.dart';
import 'package:movies_app/src/splash/splash.dart';
import 'package:movies_app/src/user_repository/user_repository.dart';

import 'authentication/authentication.dart';

class MovieApp extends StatelessWidget {
  UserRepository userRepository;

  MovieApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        darkTheme: ThemeData(
          accentColor: Color(0xff01d277),
          brightness: Brightness.light,
          primaryColor: Color(0xff01d277),
        ),
        title: 'Movie App',
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return DashboardPage(
                authenticationBloc: BlocProvider.of<AuthenticationBloc>(
                    context),
              );
            }

            if (state is AuthenticationUnauthenticated) {
              UserRepository userRepository = UserRepository();
              return LoginPage(userRepository: userRepository,);
            }

            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }

            return SplashPage();
          },
        ));
  }
}
