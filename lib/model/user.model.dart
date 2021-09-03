class UserModel {
  final String id;
  final String name;
  final String email;
  final String profilePic;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePic,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, profilePic: $profilePic)';
  }
}
