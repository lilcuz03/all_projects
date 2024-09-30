import 'package:flutter/material.dart';
import 'package:new_project/icons/app_icons.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .86,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          AppIcons.flightSearchIcon,
          const SizedBox(
            width: 10,
          ),
          Text(
            'Search',
            style:
                AppText.smallBoldHeading.copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
