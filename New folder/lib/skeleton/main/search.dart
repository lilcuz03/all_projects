import 'package:flutter/material.dart';
import 'package:new_project/skeleton/sub/reusable/double_text.dart';
import 'package:new_project/skeleton/sub/snippets/find_ticket.dart';
import 'package:new_project/skeleton/sub/snippets/landing.dart';
import 'package:new_project/skeleton/sub/snippets/row_column.dart';
import 'package:new_project/skeleton/sub/snippets/take_off.dart';
import 'package:new_project/skeleton/sub/snippets/ticket_hotel.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: AppColors.appBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'What Are\n You Looking For?',
              style:
                  AppText.bigBoldHeading.copyWith(color: AppColors.greyColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: TicketHotel(ticketText: 'Tickets', hotelText: 'Hotels')),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: TakeOff(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Landing(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: FindTicket(),
          ),
          const SizedBox(
            height: 10,
          ),
          DoubleText(
              bigtext: 'UpComing Flights', smalltext: 'View all', funck: () {}),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: RowColumn(),
          )
        ],
      ),
    );
  }
}
