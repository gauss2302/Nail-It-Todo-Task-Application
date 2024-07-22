import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';
import 'package:nail_it/features/auth/domain/usecases/user_login.dart';
import 'package:nail_it/features/auth/domain/usecases/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;

  AuthBloc(this._userSignUp, this._userLogin) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignInEvent>((event, emit) {});
    on<SignUpEvent>((event, emit) {});
    on<SignOutEvent>((event, emit) {});
  }
}
