import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:new_project/icons/app_icons.dart';
import 'package:new_project/styles/colors.dart';

class BottomNav extends StatefulWidget {
  final List widgets;
  int activeWidget;
  final Function(int) funck;
  BottomNav(
      {super.key,
      required this.widgets,
      required this.activeWidget,
      required this.funck});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [widget.widgets[widget.activeWidget]],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: widget.funck,
          showSelectedLabels: false,
          currentIndex: widget.activeWidget,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNavBg,
                icon: AppIcons.homeIcon,
                activeIcon: AppIcons.homeFilledIcon,
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNavBg,
                icon: AppIcons.profileIcon,
                activeIcon: AppIcons.profileFilledIcon,
                label: 'Profile'),
            BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNavBg,
                icon: AppIcons.ticketIcon,
                activeIcon: AppIcons.ticketFilledIcon,
                label: 'Ticket'),
            BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNavBg,
                icon: AppIcons.searchIcon,
                activeIcon: AppIcons.searchFilledIcon,
                label: 'Search'),
          ]),
    );
  }
}
