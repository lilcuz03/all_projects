import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class FindTicket extends StatelessWidget {
  const FindTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .86,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          )),
      child: Text('Find Tickets',
          style: AppText.smallHeading.copyWith(color: AppColors.whiteColor)),
    );
  }
}
