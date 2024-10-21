import 'package:flutter/material.dart';
import 'package:new_project/skeleton/sub/snippets/bottom_ticket.dart';
import 'package:new_project/skeleton/sub/snippets/teared_container.dart';
import 'package:new_project/skeleton/sub/snippets/top_ticket.dart';
import 'package:new_project/styles/colors.dart';

class Ticket extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const Ticket({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 200,
      width: size.width * .87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            isColor == null ? AppColors.fullTicketColor : AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: TopTicket(
              topTicket: ticket,
            ),
          ),
          const TearedContainer(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: BottomTicket(
              bottomTicket: ticket,
            ),
          ),
        ],
      ),
    );
  }
}
