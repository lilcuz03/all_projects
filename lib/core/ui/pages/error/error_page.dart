import 'package:bloc_practise/core/themes/app_pallet.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String text;
  const ErrorPage({super.key, this.text = 'An Error has Ocurred !'});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(text , style: const TextStyle(color: redColor, fontSize: 26 ),),
      ),
    );
  }
}
