import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';
import 'package:nail_it/features/auth/domain/usecases/auth_controller.dart';
import 'package:nail_it/features/auth/domain/usecases/user_login.dart';
import 'package:nail_it/features/auth/domain/usecases/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    // on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    // on<AuthSignUp>(_onAuthSignUp);
    // on<AuthLogin>(_onAuthLogin);
    // on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  FutureOr<void> _onAuthSignUp(event, Emitter<AuthState> emit) {

  }

  FutureOr<void> _onAuthLogin(event, Emitter<AuthState> emit) {}

  FutureOr<void> _isUserLoggedIn(event, Emitter<AuthState> emit) {}

  // Future<void> _onSignInWithGoogle(
  //   SignInWithGoogleEvent event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   emit(AuthLoading());
  //   try {
  //     final result = await _authRepo.signInWithGoogle();
  //     result.fold(
  //       (failure) => emit(AuthFailure(failure.message)),
  //       (user) => emit(AuthSuccess(user as UserModel)),
  //     );
  //   } catch (e) {
  //     emit(AuthFailure(e.toString()));
  //   }
  // }
}
