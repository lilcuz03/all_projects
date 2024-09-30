

import 'package:flutter/material.dart';

class UnknownErrorView extends StatelessWidget {
  const UnknownErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: Text('Unkown Error Occured')),
    );
  }
}