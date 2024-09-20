import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/auth/login_view.dart';
import 'package:notes/auth/register_view.dart';
import 'package:notes/error/unknown_error_view.dart';
import 'package:notes/firebase_options.dart';
import 'package:notes/home/home.dart';
import 'package:notes/index_page.dart';
import 'package:notes/loading/loading_view.dart';
import 'package:notes/routes/routes.dart';
import 'package:notes/verification/email_verification_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: ,
    routes: {
      '/': (context)=> const IndexPage(),
      loginRoute:(context)=>const LoginView(),
      registerRoute:(context)=>const RegisterView(),
      homeRoute:(context)=> const Home(),
      unknownErrorRoute :(context)=> const UnknownErrorView(),
      loadingRoute:(context)=>const LoadingView(),
      verificationRoute:(cotext)=>const EmailVerificationView(),
    },
  ),);
}
