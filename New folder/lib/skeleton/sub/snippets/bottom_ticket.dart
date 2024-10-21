import 'package:flutter/material.dart';
import 'package:new_project/skeleton/sub/snippets/ticket_text.dart';
import 'package:new_project/styles/colors.dart';

class BottomTicket extends StatelessWidget {
  final Map<String, dynamic> bottomTicket;
  final bool? isColor;
  const BottomTicket({super.key, required this.bottomTicket , this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: size.width * .85,
      decoration:  BoxDecoration(
          color:isColor == null ? AppColors.bottomTicketColor :AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TicketText(text: bottomTicket['date']),
              const SizedBox(
                height: 10,
              ),
              const TicketText(text: 'DATE'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TicketText(text: bottomTicket['departure']),
              const SizedBox(
                height: 10,
              ),
              const TicketText(text: 'DEPARTURE'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TicketText(text: bottomTicket['arrival']),
              const SizedBox(
                height: 10,
              ),
              const TicketText(text: 'ARRIVAL'),
            ],
          ),
        ],
      ),
    );
  }
}
