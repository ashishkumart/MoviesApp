import 'package:flutter/cupertino.dart';
import 'package:movies_app/src/authentication/authentication_event.dart';
import 'package:movies_app/src/authentication/authentication_state.dart';
import 'package:movies_app/src/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState {
    return AuthenticationUninitialized();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {

    await userRepository.getAuthorizationToken();

    // If application is launched, checking if user has logged in or not
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken)
        yield AuthenticationAuthenticated();
      else
        yield AuthenticationUnauthenticated();
    }

    // When user logged in successfully
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    // When user logged out
    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
