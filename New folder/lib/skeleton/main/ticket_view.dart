import 'package:flutter/material.dart';
import 'package:new_project/json/flights.dart';
import 'package:new_project/skeleton/sub/reusable/ticket.dart';
import 'package:new_project/skeleton/sub/snippets/ticket_hotel.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBg,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Tickets',
            style: AppText.bigBoldHeading,
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child:
                  TicketHotel(ticketText: 'Upcoming', hotelText: 'Previous')),
          Center(
            child: Ticket(ticket: flights[0], isColor: true),
          )
        ],
      ),
    );
  }
}
