import 'package:flutter/material.dart';
import 'package:new_project/icons/app_icons.dart';
import 'package:new_project/skeleton/sub/snippets/ticket_text.dart';
import 'package:new_project/styles/colors.dart';

class TopTicket extends StatelessWidget {
  final Map<String, dynamic> topTicket;
  final bool? isColor;
  const TopTicket({super.key, required this.topTicket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: size.width * .85,
      decoration: BoxDecoration(
          color:
              isColor == null ? AppColors.topTicketColor : AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TicketText(
                text: topTicket['from']['code'],
              ),
              const SizedBox(
                height: 10,
              ),
              TicketText(text: topTicket['from']['name']),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIcons.flightTakeOffIcon,
              const SizedBox(
                height: 10,
              ),
              TicketText(text: topTicket['flight_time']),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TicketText(text: topTicket['to']['code']),
              const SizedBox(
                height: 10,
              ),
              TicketText(text: topTicket['to']['name']),
            ],
          ),
        ],
      ),
    );
  }
}
