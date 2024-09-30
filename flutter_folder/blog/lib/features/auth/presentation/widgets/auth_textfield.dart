import 'package:flutter/material.dart';

class AuthTextfield extends StatefulWidget {
  final String hintText;
  final TextEditingController aController;
  final bool obscureText;
  // final TextEditingController email;
  // final TextEditingController password;
  // final TextEditingController name;
  const AuthTextfield({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.aController,
    // required this.email,
    // required this.password,
    // required this.name,
  });

  @override
  State<AuthTextfield> createState() => _AuthTextfieldState();
}

class _AuthTextfieldState extends State<AuthTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      enableSuggestions: false,
      autocorrect: false,
      controller: widget.aController,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "${widget.hintText} is missing ";
        } else {
          return null;
        }
      },
    );
  }
}
