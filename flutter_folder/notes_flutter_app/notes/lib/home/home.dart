import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:notes/error/unknown_error_view.dart';
import 'package:notes/firebase_options.dart';
import 'package:notes/loading/loading_view.dart';
import 'package:notes/routes/routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum MenuAction { logout }

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('LOG OUT'),
          content: const Text('Confirm Log-out'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Log Out'),
                ),
              ],
            )
          ],
        );
      }).then((value) => value ?? false);
}

class _HomeState extends State<Home> {
  final allViews = [
    const Text('Home'),
    const Text('Profile'),
    const Text('Search'),
  ];
  int currentView = 0;
  void changeView(int index) {
    setState(() {
      currentView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            try {
              return Scaffold(
                backgroundColor: const Color.fromARGB(255, 196, 131, 153),
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 187, 69, 107),
                  actions: [
                    PopupMenuButton<MenuAction>(onSelected: (value) async {
                      final isLogout = await showLogoutDialog(context);
                      if (isLogout) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute,
                          (route) => false,
                        );
                      }
                    }, itemBuilder: (context) {
                      return const [
                        const PopupMenuItem<MenuAction>(
                          value: MenuAction.logout,
                          child: Text('LOG OUT'),
                        ),
                      ];
                    })
                  ],
                ),
                body: Container(
                  padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                  child: ListView(
                    children: [
                      allViews[currentView],
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: changeView,
                  currentIndex: currentView,
                  showSelectedLabels: false,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.black,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          FluentIcons.home_24_regular,
                          color: Colors.white,
                        ),
                        activeIcon: Icon(
                          FluentIcons.home_24_filled,
                          color: Colors.pink,
                        ),
                        label: 'HOME'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          FluentIcons.person_24_regular,
                          color: Colors.white,
                        ),
                        activeIcon: Icon(
                          FluentIcons.person_24_filled,
                          color: Colors.pink,
                        ),
                        label: 'Profile'),
                    BottomNavigationBarItem(
                      icon: Icon(
                        FluentIcons.search_24_regular,
                        color: Colors.white,
                      ),
                      activeIcon: Icon(
                        FluentIcons.search_24_filled,
                        color: Colors.pink,
                      ),
                      label: 'search',
                    ),
                  ],
                ),
              );
            } catch (e) {
              return const UnknownErrorView();
            }
          default:
            return const LoadingView();
        }
      },
    );
  }
}

