import 'package:nail_it/features/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  final String id;
  final String username;
  final String email;
  final String name;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.photoUrl,
  }) : super(id: '', username: '', email: '', name: '', photoUrl: '');

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
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'username': username,
  //     'email': email,
  //     'name': name,
  //     'photoUrl': photoUrl,
  //   };
  // }
}
