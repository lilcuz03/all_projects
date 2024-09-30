import 'package:blog/core/routes/routes.dart';
import 'package:blog/core/theme/app_pallet.dart';
import 'package:blog/features/auth/presentation/widgets/auth_button.dart';
import 'package:blog/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    emailController;
    passwordController;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // AuthTextfield(
                  //   hintText: 'Name',
                  //   aController: nameController,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
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
                    text: 'Login',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.signUpRoute,
                        (route) => false,
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                          text: "dont't have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
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
