import 'package:ecommerce/BLoC/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegistrationBloc>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
                child: Material(
                  elevation: 20,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: StreamBuilder(
                      stream: bloc.registrationEmail,
                      builder: (context, AsyncSnapshot<String> snapshot) =>
                          TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            icon: Icon(Icons.email)),
                        onChanged: (value) {
                          bloc.changeRegistrationEmail(value);
                        },
                      ),
                    ),
                  ),
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
                    child: StreamBuilder(
                      stream: bloc.registrationName,
                      builder: (context, AsyncSnapshot<String> snapshot) =>
                          TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            icon: Icon(Icons.person)),
                        onChanged: (value) {
                          bloc.changeRegistrationName(value);
                        },
                      ),
                    ),
                  ),
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
                    child: StreamBuilder(
                      stream: bloc.registrationPassword,
                      builder: (context, snapshot) => TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            icon: Icon(Icons.lock)),
                        onChanged: (value) =>
                            bloc.changeRegistrationPassword(value),
                      ),
                    ),
                  ),
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
                    child: StreamBuilder(
                      stream: bloc.registrationCnfPassword,
                      builder: (context, snapshot) => TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            icon: Icon(Icons.lock)),
                        onChanged: (value) =>
                            bloc.changeRegistrationCnfPassword(value),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
