import 'package:flutter/cupertino.dart';
import 'package:movies_app/src/login/login_event.dart';
import 'package:movies_app/src/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:movies_app/src/user_repository/user_repository.dart';
import 'package:movies_app/src/authentication/authentication.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);
  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event)async* {
    // TODO: implement mapEventToState
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
  }
  }
  }
}