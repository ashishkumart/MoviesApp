import 'package:bloc/bloc.dart';
import 'package:movies_app/src/sign_up/sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  SignUpBloc();

  @override
  SignUpState get initialState => SignUpState.initial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is FirstNameChanged) {
      yield currentState.copyWith(
          firstName: event.firstName, isEmailEmpty: event.firstName.isEmpty);
    }

    if (event is LastNameChanged) {
      yield currentState.copyWith(
          lastName: event.lastName, isEmailEmpty: event.lastName.isEmpty);
    }

    if (event is EmailChanged) {
      if (event.email.isEmpty) {
        yield currentState.copyWith(
            email: event.email, isEmailEmpty: event.email.isEmpty);
      } else {
        yield currentState.copyWith(
            email: event.email, isEmailValid: _isEmailValid(event.email));
      }
    }

    if (event is PasswordChanged) {
      if (event.password.isEmpty) {
        yield currentState.copyWith(
            password: event.password, isPasswordEmpty: event.password.isEmpty);
      } else {
        yield currentState.copyWith(
            password: event.password,
            isPasswordValid: _isPasswordValid(event.password));
      }
    }

    if (event is FormSubmitted) {
      yield currentState.copyWith(formSubmittedSuccessfully: true);
    }
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
