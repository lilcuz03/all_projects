import 'package:flutter/material.dart';
import 'package:new_project/skeleton/main/main_board.dart';
import 'package:new_project/skeleton/sub/sub-main/hotel.dart';
import 'package:new_project/skeleton/sub/sub-main/tickets.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MainBoard(),
      'tickets': (context) => const Tickets(),
      'hotels': (context) => const Hotel(),
    },
  ));
}
