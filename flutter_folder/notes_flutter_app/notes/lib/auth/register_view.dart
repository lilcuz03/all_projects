import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/error/unknown_error_view.dart';
import 'package:notes/firebase_options.dart';
import 'dart:developer' as devetools show log;

import 'package:notes/loading/loading_view.dart';
import 'package:notes/routes/routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            try {
              return Scaffold(
                backgroundColor: const Color.fromARGB(255, 214, 88, 132),
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * .3,
                    ),
                    Container(
                      width: size.width * .4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 100, horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21),
                          bottomLeft: Radius.circular(21),
                          bottomRight: Radius.circular(21),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Color.fromARGB(255, 166, 58, 132),
                                fontSize: 22),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Email',
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(21),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            controller: _password,
                            decoration: const InputDecoration(
                              // iconColor: Colors.white,
                              hintText: 'Enter Your Password',
                              filled: true,
                              fillColor: Color.fromARGB(255, 69, 213, 239),
                              // suffixStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(21),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                // style: ButtonStyle(backgroundColor:),
                                onPressed: () async {
                                  final email = _email.text;
                                  final password = _password.text;
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    final user =
                                        FirebaseAuth.instance.currentUser;
                                    await user?.sendEmailVerification();

                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      verificationRoute,
                                      (route) => false,
                                    );
                                    devetools.log(user.toString());
                                  } on FirebaseAuthException catch (e) {
                                    devetools.log(e.toString());
                                    if (e.code == 'invalid-credential') {
                                      devetools.log(
                                          'either email or password is invalid');
                                      devetools.log(e.toString());
                                    }
                                    // devetools.log(e.runtimeType.toString());
                                    // devetools.log(e.code.toString());
                                  }
                                },
                                child: const Text('Register'),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    loginRoute,
                                    (route) => false,
                                  );
                                },
                                child: const Text(
                                  "got  an account?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 28, 197, 227)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * .3,
                    ),
                  ],
                ),
              );
            } catch (e) {
              devetools.log(e.runtimeType.toString());
            }
          default:
            return const LoadingView();
        }
        return const UnknownErrorView();
      },
    );
  }
}
