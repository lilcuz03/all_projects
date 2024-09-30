import 'package:blog/core/routes/routes.dart';
import 'package:blog/core/theme/theme.dart';
import 'package:blog/features/auth/presentation/pages/login_page.dart';
import 'package:blog/features/auth/presentation/pages/sign_up_page.dart';
// import 'package:blog/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
      routes: {
        AppRoutes.loginRoute:(context)=>const LoginPage(),
        AppRoutes.signUpRoute:(context)=> const SignUpPage(),
      },
    );
  }
}
