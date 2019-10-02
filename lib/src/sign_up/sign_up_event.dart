import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpEvent extends Equatable {
  SignUpEvent([List props = const []]) : super(props);
}

class FirstNameChanged extends SignUpEvent {
  final String firstName;

  FirstNameChanged({@required this.firstName}) : super([firstName]);

  @override
  String toString() => 'First Name { firstName: $firstName }';
}

class LastNameChanged extends SignUpEvent {
  final String lastName;

  LastNameChanged({@required this.lastName}) : super([lastName]);

  @override
  String toString() => 'LastNameChanged { firstName: $lastName }';
}

class EmailChanged extends SignUpEvent {
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => 'EmailChanged { email: $email }';
}

class PasswordChanged extends SignUpEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class FormSubmitted extends SignUpEvent {
  @override
  String toString() => 'FormSubmitted';
}
