class UserModel {
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
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
