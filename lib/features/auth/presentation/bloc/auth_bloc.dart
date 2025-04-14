import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';
import 'package:nail_it/features/auth/domain/entities/user.dart';
import 'package:nail_it/features/auth/domain/usecases/get_current_user.dart';
import 'package:nail_it/features/auth/domain/usecases/logout_user.dart';
import 'package:nail_it/features/auth/domain/usecases/refresh_token.dart';
import 'package:nail_it/features/auth/domain/usecases/user_login.dart';
import 'package:nail_it/features/auth/domain/usecases/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final RegisterUser _userSignUp;
  final LoginUser _userLogin;
  final LogoutUser _logoutUser;
  final GetCurrentUser _getCurrentUser;
  final RefreshToken _refreshToken;

  AuthBloc({
    required RegisterUser userSignUp,
    required LoginUser userLogin,
    required LogoutUser logoutUser,
    required GetCurrentUser getCurrentUser,
    required RefreshToken refreshToken,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _logoutUser = logoutUser,
        _getCurrentUser = getCurrentUser,
        _refreshToken = refreshToken,
        super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthRefreshRequested>(_onAuthRefreshRequested);
  }

  FutureOr<void> _onAuthCheckRequested(
      AuthCheckRequested event,
      Emitter<AuthState> emit
      ) async {
    emit(AuthLoading());

    final userResult = await _getCurrentUser(NoParams());

    emit(userResult.fold(
          (failure) => AuthUnauthenticated(),
          (user) => AuthAuthenticated(user: user),
    ));
  }

  FutureOr<void> _onAuthLoginRequested(
      AuthLoginRequested event,
      Emitter<AuthState> emit
      ) async {
    emit(AuthLoading());

    final result = await _userLogin(LoginParams(
      email: event.email,
      password: event.password,
    ));

    emit(result.fold(
          (failure) => AuthFailure(failure.message),
          (authResponse) => AuthAuthenticated(
        user: authResponse.user,
        token: authResponse.accessToken,
      ),
    ));
  }

  FutureOr<void> _onAuthRegisterRequested(
      AuthRegisterRequested event,
      Emitter<AuthState> emit
      ) async {
    emit(AuthLoading());

    final result = await _userSignUp(RegisterParams(
      email: event.email,
      password: event.password,
      name: event.name,
      phone: event.phone,
    ));

    emit(result.fold(
          (failure) => AuthFailure(failure.message),
          (authResponse) => AuthAuthenticated(
        user: authResponse.user,
        token: authResponse.accessToken,
      ),
    ));
  }

  FutureOr<void> _onAuthLogoutRequested(
      AuthLogoutRequested event,
      Emitter<AuthState> emit
      ) async {
    emit(AuthLoading());

    final result = await _logoutUser(NoParams());

    emit(result.fold(
          (failure) => AuthFailure(failure.message),
          (_) => AuthUnauthenticated(),
    ));
  }

  FutureOr<void> _onAuthRefreshRequested(
      AuthRefreshRequested event,
      Emitter<AuthState> emit
      ) async {
    if (state is AuthAuthenticated) {
      final result = await _refreshToken(NoParams());

      emit(result.fold(
            (failure) => AuthUnauthenticated(),
            (authResponse) => AuthAuthenticated(
          user: authResponse.user,
          token: authResponse.accessToken,
        ),
      ));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final type = json['type'] as String?;

      if (type == 'authenticated') {
        return AuthAuthenticated(
          user: UserModel.fromJson(json['user']),
          token: json['token'],
        );
      }

      return AuthUnauthenticated();
    } catch (_) {
      return AuthUnauthenticated();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthAuthenticated) {
      return {
        'type': 'authenticated',
        'user': state.user is UserModel
            ? (state.user as UserModel).toJson()
            : {
          'id': state.user.id,
          'username': state.user.username,
          'email': state.user.email,
          'name': state.user.name,
          'createdAt': state.user.createdAt.toIso8601String(),
          'updatedAt': state.user.updatedAt.toIso8601String(),
        },
        'token': state.token,
      };
    } else {
      return {'type': 'unauthenticated'};
    }
  }
}