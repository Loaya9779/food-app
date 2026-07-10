class UserModel {
  final String id;
  final String name;
  final String email;
  final List<dynamic> favorites;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.favorites,
  });
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name, 'favorites': favorites};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      favorites: json['favorites'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
