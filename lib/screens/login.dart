// ignore_for_file: avoid_print

import 'dart:math';

import 'package:ecommerce/controllers/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future login() async {}
  // var env = DotEnv(includePlatformEnvironment: true)..load();
  loginController emails = Get.put(loginController());

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of<LoginBloc>(context, listen: true);

    // print(dotenv.env['MAIN_URL']);
    // print(env);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey.shade400],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Login', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
                child: Material(
                  elevation: 20,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emails.emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            labelText: 'Email',
                            // ignore: prefer_null_aware_operators
                            // errorText: snapshot.error != null
                            //     ? snapshot.error.toString()
                            //     : null,
                            // errorText: snapshot.error as String,
                            icon: Icon(Icons.email)),
                        onChanged: (value) {
                          emails.emailController.obs;
                        },
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
                child: Material(
                  elevation: 20,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: emails.passwordController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          // ignore: prefer_null_aware_operators
                          // errorText: snapshot.error != null
                          //     ? snapshot.error.toString()
                          //     : null,
                          icon: Icon(Icons.lock)),
                      onChanged: (value) => emails.passwordController.obs,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () async {
                        emails.login();
                        // snapshot.hasError || !snapshot.hasData
                        //     ? print(snapshot.error)
                        //     : await bloc.submit() == 201
                        //         ? Navigator.pushReplacement(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => const Home()))
                        //         : null;
                      },
                      style:
                          ButtonStyle(elevation: MaterialStateProperty.all(20)),
                      child: const Text('Login')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
