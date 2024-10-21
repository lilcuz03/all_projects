import 'package:flutter/material.dart';
import 'package:new_project/styles/text.dart';

class TicketText extends StatelessWidget {
  final String text;
  // final bool? isColor;
  const TicketText({super.key , required this.text ,});

  @override
  Widget build(BuildContext context) {
    return Text(text, style:AppText.ticketText,);
  }
}