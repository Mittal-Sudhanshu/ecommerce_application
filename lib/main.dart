// import 'package:ecommerce/BLoC/user_bloc.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:ecommerce/utils/themeClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: 'splashScreen',
        routes: {
          'splashScreen': (context) => const SplashScreen(),
          'login': (context) => const Login()
        },
      ),
    );
  }
}
