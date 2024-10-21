import 'package:flutter/material.dart';
import 'package:new_project/json/flights.dart';
import 'package:new_project/skeleton/sub/reusable/ticket.dart';
import 'package:new_project/styles/colors.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: flights
                .map((singleTicket) => Ticket(ticket: singleTicket))
                .toList(),
          ),
        ),
      ),
    );
  }
}
