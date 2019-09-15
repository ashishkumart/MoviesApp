import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  //AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
