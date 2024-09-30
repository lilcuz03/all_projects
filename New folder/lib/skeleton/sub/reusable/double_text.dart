import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class DoubleText extends StatelessWidget {
  final String bigtext;
  final String smalltext;
  VoidCallback funck;
  DoubleText(
      {super.key,
      required this.bigtext,
      required this.smalltext,
      required this.funck});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigtext,
          style:
              AppText.mediumBoldHeading.copyWith(color: AppColors.greyColor),
        ),
        InkWell(
          onTap: funck,
          child: Text(
            smalltext,
            style: const TextStyle(color: AppColors.blackColor),
          ),
        )
      ],
    );
  }
}
