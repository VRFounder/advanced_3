import 'dart:convert';

import 'package:advanced_3/model/account_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureService {
  static storeApiKey(String api_key) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "api_key", value: api_key);
  }

  static Future<String?> loadApiKey() async {
    const storage = FlutterSecureStorage();
    String? api_key = await storage.read(key: "api_key");
    return api_key;
  }

  static Future<void> removeApiKey() async{
    const storage = FlutterSecureStorage();
    await storage.delete(key: "api_key");
  }

  static storeAccount(Account user) async {
    const storage = FlutterSecureStorage();
    String stringUser = jsonEncode(user);
    await storage.write(key: "account", value: stringUser);
  }

  static Future<Account?> loadAccount() async {
    const storage = FlutterSecureStorage();
    String? stringUser = await storage.read(key: "account");
    if (stringUser == null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);

    return Account.fromJson(map);
  }

  static Future<void> removeAccount() async{
    const storage = FlutterSecureStorage();
    await storage.delete(key: "account");
  }
}