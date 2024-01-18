import 'package:dahar_app/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/extensions.dart' show EmailValidator;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _registerForm = GlobalKey<FormState>();
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
      body: Form(
        key: _registerForm,
        child: Column(
          children: [
            TextFormField(
              controller: _email,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your email'),
              validator: (value) => value!.isNotEmpty && value.isValidEmail() ? null : "Please enter a valid email address."
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your password'),
            ),
            TextButton(
              onPressed: () async {
                if (_registerForm.currentState!.validate()) {
                  final String email = _email.text;
                  final String password = _password.text;
                  final context = _registerForm.currentContext;
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password);
                    } on FirebaseAuthException catch (e) {
                        if (context != null && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
                        }
                      } finally {
                        if (context != null && context.mounted) {
                          Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
                        }
                      }
                }
              },
              child: const Text('Register!')
            ),
          ]
        ),
      )
    );
  }
}
