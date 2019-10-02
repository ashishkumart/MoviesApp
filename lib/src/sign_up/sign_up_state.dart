import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SignUpState extends Equatable {
  final String firstName;
  final bool isFirstNameEmpty;

  final String lastName;
  final bool isLastNameEmpty;

  final String email;
  final bool isEmailEmpty;
  final bool isEmailValid;

  final String password;
  final bool isPasswordEmpty;
  final bool isPasswordValid;

  final bool formSubmittedSuccessfully;

  bool get isFormValid =>
      !isFirstNameEmpty &&
      !isLastNameEmpty &&
      !isEmailEmpty &&
      isEmailValid &&
      !isPasswordEmpty &&
      isPasswordValid;

  SignUpState(
      {@required this.firstName,
      @required this.isFirstNameEmpty,
      @required this.lastName,
      @required this.isLastNameEmpty,
      @required this.email,
      @required this.isEmailEmpty,
      @required this.isEmailValid,
      @required this.password,
      @required this.isPasswordEmpty,
      @required this.isPasswordValid,
      @required this.formSubmittedSuccessfully})
      : super([
          firstName,
          isFirstNameEmpty,
          lastName,
          isLastNameEmpty,
          email,
          isEmailEmpty,
          isEmailValid,
          password,
          isPasswordEmpty,
          isPasswordValid,
          formSubmittedSuccessfully
        ]);

  factory SignUpState.initial() {
    return SignUpState(
      firstName: '',
      isFirstNameEmpty: true,
      lastName: '',
      isLastNameEmpty: true,
      email: '',
      isEmailEmpty: true,
      isEmailValid: false,
      password: '',
      isPasswordEmpty: true,
      isPasswordValid: false,
      formSubmittedSuccessfully: false,
    );
  }

  SignUpState copyWith({
    String firstName,
    bool isFirstNameEmpty,
    String lastName,
    bool isLastNameEmpty,
    String email,
    bool isEmailEmpty,
    bool isEmailValid,
    String password,
    bool isPasswordEmpty,
    bool isPasswordValid,
    bool formSubmittedSuccessfully,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      isFirstNameEmpty: isFirstNameEmpty ?? this.isFirstNameEmpty,
      lastName: lastName ?? this.lastName,
      isLastNameEmpty: isLastNameEmpty ?? this.isLastNameEmpty,
      email: email ?? this.email,
      isEmailEmpty: isEmailEmpty ?? this.isEmailEmpty,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordEmpty: isPasswordEmpty ?? this.isPasswordEmpty,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      formSubmittedSuccessfully:
          formSubmittedSuccessfully ?? this.formSubmittedSuccessfully,
    );
  }
}

class SignUpLoading extends SignUpState {}
