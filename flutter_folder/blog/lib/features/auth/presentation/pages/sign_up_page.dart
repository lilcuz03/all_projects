import 'package:blog/core/routes/routes.dart';
import 'package:blog/core/theme/app_pallet.dart';
import 'package:blog/features/auth/presentation/widgets/auth_button.dart';
import 'package:blog/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void initState() {
    emailController;
    passwordController;
    nameController;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SizedBox(
            width: size.width * .7,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up.',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextfield(
                    hintText: 'Name',
                    aController: nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextfield(
                    hintText: 'Email',
                    aController: emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextfield(
                    obscureText: true,
                    hintText: 'Password',
                    aController: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AuthButton(
                    text: 'Sign Up',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginRoute,
                        (route) => false,
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                          text: "already have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Log in',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppPallet.blueColor,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
