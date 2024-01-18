import 'package:dahar_app/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          decoration:
              const InputDecoration(hintText: 'Enter your email here: '),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration:
              const InputDecoration(hintText: 'Enter your email here: '),
        ),
        TextButton(
            onPressed: () async {
              final String email = _email.text;
              final String password = _password.text;
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, password: password);
            },
            child: const Text('Register!')),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(homeRoute, (route) => false);
            },
            child: const Text('Home'))
      ]),
    );
  }
}
