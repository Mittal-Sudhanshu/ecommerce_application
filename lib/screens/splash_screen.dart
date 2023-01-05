// ignore_for_file: unused_import

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:ecommerce/screens/homePage.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetStorage box = GetStorage();

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // String? token;
  @override
  Widget build(BuildContext context) {
    print(box.read('token'));
    return EasySplashScreen(
      logo: Image.asset('assets/logo.png'),
      title: const Text(
        'Ecommerce',
        style: TextStyle(fontSize: 18),
      ),
      navigator: box.read('token') == null ? Login() : Home(),
    );
  }
}
