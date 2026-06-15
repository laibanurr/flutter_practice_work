import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setUser(String email, String password) {
    _email = email;
    _password = password;
    notifyListeners();
  }

  void logout() {
    _email = '';
    _password = '';
    notifyListeners();
  }
}
