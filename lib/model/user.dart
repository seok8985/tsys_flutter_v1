class User {
  final int id;
  final String userId;
  final String? name;
  final String? email;

  User({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        userId: json['userId'],
        name: json['name'],
        email: json['email']);
  }
}
