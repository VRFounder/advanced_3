import 'package:uuid/uuid.dart';

class Account {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;

  Account({String? id, required this.name, required this.phone, required this.email, required this.password})
      : id = id ?? const Uuid().v4();

  Account.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'password': password,
  };
}
