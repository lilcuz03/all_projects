import 'package:bloc_practise/core/routes/app_routes.dart';
import 'package:bloc_practise/core/themes/app_theme.dart';
import 'package:bloc_practise/features/cart/presentation/pages/cart.dart';
import 'package:bloc_practise/features/home/presentation/pages/home.dart';
import 'package:bloc_practise/features/wish/presentation/pages/wish.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appDarkTheme,
    home: const Home(),
    routes: {
      toCartRoute: (context) => const Cart(),
      toWishRoute: (context) => const Wish(),
      toHomeRoute: (context) => const Home(),
    },
  ));
}
