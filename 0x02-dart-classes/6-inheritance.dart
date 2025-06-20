import '6-password.dart';

class User extends Password {
  final String? name;
  final int? age;
  final double? height;
  final int? id;

  User({required this.name, required this.age, required this.height, required this.id, required String user_password}) 
      : super(password: user_password);

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'name': name ?? "",
      'age': age ?? 0,
      'height': height ?? 0.0,
    };
  }

  static User fromJson(Map<dynamic, dynamic> userJson) {
    User user = User(
      id: userJson['id'] ?? 0,
      name: userJson['name'] ?? "",
      age: userJson['age'] ?? 0,
      height: userJson['height'] ?? 0.0,
      user_password: userJson['user_password'] ?? "",
    );
    user.isValid();
    return user;
  }

  @override
  String toString() {
    return "User(id : ${id ?? 0} ,name: ${name ?? ""}, age: ${age ?? 0}, height: ${height ?? 0.0}, Password: ${isValid()})";
  }

  set user_password(String newPassword) {
    password = newPassword;
    isValid();
  }
}
