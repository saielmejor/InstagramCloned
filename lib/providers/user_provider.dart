import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get getUser => _user!;
  final AuthMethods _authMethods = AuthMethods(); // initialized authMethods

//updates the value of the user
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners(); // notifies all listeners
  }
}
