import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class Hotels extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const Hotels({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .35,
      // height: 200,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            height: 300,
            width: size.width * .3,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage(hotel['img']), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                hotel['name'],
                style:
                    AppText.smallHeading.copyWith(color: AppColors.whiteColor),
              ),
              Text(
                hotel['price'],
                style:
                    AppText.smallHeading.copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
