import 'package:flutter/material.dart';
import 'package:new_project/skeleton/main/home.dart';
import 'package:new_project/skeleton/main/search.dart';
import 'package:new_project/skeleton/main/ticket_view.dart';
import 'package:new_project/skeleton/sub/sub-main/bottom/bottom_nav.dart';
// import 'package:new_project/styles/colors.dart';

class MainBoard extends StatefulWidget {
  const MainBoard({super.key});

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  int currentWidget = 0;

  final allWidgets = [
    const Home(),
    const Text('profile Page Here'),
    const TicketView(),
    const Search(),
  ];
  void changeWidget(int index) {
    setState(() {
      currentWidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(color: AppColors.appBg, child: allWidgets[currentWidget]),
      bottomNavigationBar: BottomNav(
          widgets: allWidgets,
          activeWidget: currentWidget,
          funck: changeWidget),
    );
  }
}
