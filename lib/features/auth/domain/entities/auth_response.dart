import 'package:equatable/equatable.dart';
import 'package:nail_it/features/auth/domain/entities/user.dart';

class AuthResponse extends Equatable {
  final User user;
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  const AuthResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  List<Object?> get props => [
        user,
        accessToken,
        refreshToken,
        expiresIn,
      ];
}
