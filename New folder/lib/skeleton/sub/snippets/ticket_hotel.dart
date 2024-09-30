import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class TicketHotel extends StatelessWidget {
  final String ticketText;
  final String hotelText;
  const TicketHotel(
      {super.key, required this.ticketText, required this.hotelText});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .86,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * .43,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: Text(
              ticketText,
              style: AppText.smallHeading.copyWith(color: AppColors.whiteColor),
            ),
          ),
          Container(
            width: size.width * .43,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Text(
              hotelText,
              style: AppText.smallHeading.copyWith(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
