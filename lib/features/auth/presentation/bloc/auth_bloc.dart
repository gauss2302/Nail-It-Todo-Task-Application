import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignInEvent>((event, emit) {});
    on<SignUpEvent>((event, emit) {});
    on<SignOutEvent>((event, emit) {});
  }
}
