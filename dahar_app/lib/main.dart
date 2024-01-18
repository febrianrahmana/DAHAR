import 'package:dahar_app/const/routes.dart';
import 'package:dahar_app/features/login.dart';
import 'package:dahar_app/features/logout.dart';
import 'package:dahar_app/features/register.dart';
import 'package:dahar_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'DAHAR!',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade300),
      useMaterial3: true,
    ),
    home: const Home(),
    routes: {
      homeRoute: (context) => const Home(),
      registerRoute: (context) => const RegisterView(),
      loginRoute: (context) => const LoginView(),
      logoutRoute: (context) => const LogoutView()
    },
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('DAHAR!')),
        backgroundColor: Colors.red.shade300,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  registerRoute, (route) => false)
                            },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        child: const Text('REGISTER')),
                    TextButton(
                        onPressed: () => {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  loginRoute, (route) => false)
                            },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        child: const Text('LOGIN')),
                    TextButton(
                        onPressed: () => {},
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        child: const Text('EXPLORE!')),
                    TextButton(
                        onPressed: () => {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  logoutRoute, (route) => false)
                            },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        child: const Text('LOGOUT'))
                  ],
                ),
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
