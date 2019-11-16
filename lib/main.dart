import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/app.dart';
import 'package:movies_app/src/authentication/authentication.dart';
import 'package:movies_app/src/user_repository/user_repository.dart';
import 'package:movies_app/widgets/radio_button_list.dart';

void main() {
  final UserRepository userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    builder: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..dispatch(AppStarted());
    },
    child: /*MovieApp(
      userRepository: userRepository,
    )*/RadioButtonList(),
  ));
}
