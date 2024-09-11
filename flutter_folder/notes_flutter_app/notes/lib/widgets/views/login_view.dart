import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: Text(),
      // ),
      backgroundColor: Colors.brown,
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              print('current use : ${FirebaseAuth.instance.currentUser} ');

              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                width: size.width * .85,
                margin:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                height: 300,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 119, 215, 247),
                    borderRadius: BorderRadius.circular(21)),
                child: Column(
                  children: [
                    const Center(child: Text('Login')),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration:
                          const InputDecoration(hintText: 'Enter your email'),
                    ),
                    TextField(
                      controller: _password,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Enter your password'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _email.text;

                              try {
                                final userCredential = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);

                                print(userCredential);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'invalid-credential') {
                                  print('user not found');
                                }
                              }
                            },
                            child: const Text('Login')),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'new_user');
                          },
                          child: const Text('dont have an acount'),
                        )
                      ],
                    )
                  ],
                ),
              );
            default:
              return const Text('Page Loading');
          }
        },
      ),
    );
  }
}
