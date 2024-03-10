import 'package:uuid/uuid.dart';

class User {
  String? id;
  String? email;
  String? password;

  User({String? id, required this.email, required this.password})
      : id = id ?? const Uuid().v4();
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
      };
}
