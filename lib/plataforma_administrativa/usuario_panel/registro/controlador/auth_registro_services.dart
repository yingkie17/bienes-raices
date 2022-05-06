import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRegistroServices extends ChangeNotifier {
  // Las claves del Api Key y el token del api
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBMeT6mImc_8chgI7KhS1No6vYx77IcFGo';
  final storage = new FlutterSecureStorage();
// Si Vamos a retornar es un error
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);

      // return decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}
