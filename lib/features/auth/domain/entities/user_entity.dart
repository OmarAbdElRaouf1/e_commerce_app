class UserEntity {
  final String name;
  final String id;
  final String email;

  UserEntity({
    required this.name,
    required this.id,
    required this.email,
  });

  toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
    };
  }
}
