import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
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
                      const Center(child: Text('Register')),
                      TextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration:
                            const InputDecoration(hintText: 'Enter Email'),
                      ),
                      TextField(
                        controller: _password,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter password'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () async {
                                try {
                                  final email = _email.text;
                                  final password = _password.text;
                                  final userCredential = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                  if (e.code == 'email-already-in-use') {
                                    print('user already in use');
                                  }
                                }
                                ;
                              },
                              child: const Text('Register')),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: const Text('have an account'))
                        ],
                      )
                    ],
                  ),
                );
              default:
                return const Text('Loading...');
            }
          }),
    );
  }
}
