import 'dart:async';
import 'dart:convert';
import 'package:ecommerce/BLoC/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc with Validator {
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  //Getters

  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPassword =>
      _loginPassword.stream.transform(loginPasswordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPassword, (a, b) => true);
  //Setters

  Function(String) get changeLoginEmail => _loginEmail.sink.add;

  Function(String) get changePassword => _loginPassword.sink.add;
  submit() async {
    final url = '${dotenv.env['MAIN_URL']}/user/login';
    // print(url);
    // print(_loginEmail.valueOrNull);
    // print(_loginPassword.valueOrNull);
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var response = await http.post(Uri.parse(url),
          headers: header,
          body: jsonEncode({
            "email": _loginEmail.value.toString(),
            "password": _loginPassword.value.toString()
          }));
      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', jsonDecode(response.body)['token']);
        // print(prefs);
      }
      if (kDebugMode) {
        print(response.statusCode);
      }
      return response.statusCode;
    } catch (e) {
      // log(err);
      debugPrint(e.toString());
    }
  }

  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}
