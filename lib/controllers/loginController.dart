// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class loginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  // var email = emailController.text.obs;
  TextEditingController passwordController = TextEditingController();
  GetStorage box = GetStorage();

  final url = '${dotenv.env['MAIN_URL']}/user/login';

  login() async {
    print(url);
    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({
            'email': emailController.text.trim(),
            'password': passwordController.text
          }),
          headers: Constants().header);
      print(emailController.text);
      print(passwordController.text);
      print(response.statusCode);
      if (response.statusCode == 201) {
        await box.write('token', jsonDecode(response.body)['token']);
        print('here');
        print(box.read('token'));
        Get.off(() => Home());
      }
    } catch (e) {
      throw Error();
    }
  }
}
