import 'package:ecommerce/BLoC/login_bloc.dart';
import 'package:ecommerce/BLoC/registration_bloc.dart';
import 'package:ecommerce/BLoC/search_bloc.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:ecommerce/utils/themeClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        Provider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        Provider<RegistrationBloc>(create: (context) => RegistrationBloc())
      ],
      child: MaterialApp(
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
