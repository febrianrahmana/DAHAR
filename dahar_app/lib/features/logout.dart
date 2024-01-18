import 'package:dahar_app/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Log in to your account first')),
          ),
          body: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      (Navigator.of(context).pushNamedAndRemoveUntil(
                          homeRoute, (route) => false));
                    },
                    child: const Text('OK'))
              ],
            ),
          ));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Log Out?'),
        ),
        body: Column(children: [
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text('YES')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(homeRoute, (route) => false);
              },
              child: const Text('NO')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(homeRoute, (route) => false);
              },
              child: const Text('HOME'))
        ]));
  }
}
