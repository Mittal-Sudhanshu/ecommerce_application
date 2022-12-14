import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:ecommerce/screens/homePage.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  String? token;
  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      setState(() {
        token = prefs.getString('token');
      });
    } catch (er) {
      if (kDebugMode) {
        print(er);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/logo.png'),
      title: const Text(
        'Ecommerce',
        style: TextStyle(fontSize: 18),
      ),
      navigator: token == null ? const Login() : const Home(),
    );
  }
}
