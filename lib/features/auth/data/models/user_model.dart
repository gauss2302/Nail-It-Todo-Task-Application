class UserModel {
  final String id;
  final String email;
  final String name;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
