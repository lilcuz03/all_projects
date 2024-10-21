import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/error/unknown_error_view.dart';
import 'package:notes/firebase_options.dart';
import 'package:notes/loading/loading_view.dart';
import 'package:notes/routes/routes.dart';
import 'dart:developer' as devetools show log;

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
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
            final user = FirebaseAuth.instance.currentUser;
            devetools.log(user.toString());

            try {
              if (user?.uid != null) {
                if (user?.emailVerified == true) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    verificationRoute,
                    (route) => false,
                  );
                }
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
