import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isLoading = false;
  //vamos usar un getter
  bool get isLoading => _isLoading;

// vamos usar un set para estableces el valor a isLoading
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkey.currentState?.validate() ?? false);
    return formkey.currentState?.validate() ?? false;
  }
}
