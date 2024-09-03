part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

sealed class SignInEvent extends AuthEvent {
  const SignInEvent();
}

sealed class SignUpEvent extends AuthEvent {
  const SignUpEvent();
}

// Sign In Events
class SignInEventWithEmailandPasswordEvent extends SignInEvent {
  final String email;
  final String password;
  final String name;

  const SignInEventWithEmailandPasswordEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogleEvent extends SignInEvent {
  const SignInWithGoogleEvent();
}

class SignInWithAppleEvent extends SignInEvent {
  const SignInWithAppleEvent();
}

// Sign Up Events
class SignUpEventWithEmailandPasswordEvent extends SignUpEvent {
  final String email;
  final String password;

  const SignUpEventWithEmailandPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUpWithGoogleEvent extends SignUpEvent {
  const SignUpWithGoogleEvent();
}

class SignUpWithAppleEvent extends SignUpEvent {
  const SignUpWithAppleEvent();
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}
