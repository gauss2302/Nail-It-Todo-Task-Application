import 'package:nail_it/features/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.name,
      required super.photoUrl});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
    );
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return UserModel(
      id: id ?? super.id,
      username: username ?? super.username,
      email: email ?? super.email,
      name: name ?? super.name,
      photoUrl: photoUrl ?? super.photoUrl,
    );
  }
}
