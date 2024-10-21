import 'package:flutter/material.dart';

class LaodingPage extends StatelessWidget {
  const LaodingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
