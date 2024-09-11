import 'package:flutter/material.dart';
import 'package:notes/widgets/home.dart';
// import 'package:notes/widgets/home.dart';
import 'package:notes/widgets/views/login_view.dart';
import 'package:notes/widgets/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Home(),
      'new_user': (context) => const RegisterView(),
      'login': (context) => const LoginView(),
    },
  ));
}
