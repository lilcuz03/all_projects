import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/error/unknown_error_view.dart';
import 'package:notes/firebase_options.dart';
import 'package:notes/loading/loading_view.dart';
import 'package:notes/routes/routes.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (
        BuildContext context,
        AsyncSnapshot<FirebaseApp> snapshot,
      ) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            try {
              final user = FirebaseAuth.instance.currentUser;
              if (user?.uid != null) {
                return Scaffold(
                  appBar: AppBar(),
                  backgroundColor: const Color.fromARGB(255, 137, 34, 75),
                  body: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 100, horizontal: 20),
                    child: Column(
                      children: [
                        const Text(
                          'if an email verification link has not been recdived , click the button below',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () async {
                                await user?.sendEmailVerification();
                              },
                              child: const Text(
                                'Verify',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 33, 201, 243),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              }
            } catch (e) {}
          default:
            return const LoadingView();
        }
        return const UnknownErrorView();
      },
    );
  }
}
