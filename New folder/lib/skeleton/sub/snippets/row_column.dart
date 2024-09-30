import 'package:flutter/material.dart';
import 'package:new_project/media/media.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .85,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 480,
            width: size.width * .4,
            child: Column(
              children: [
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            Media.planeSeats,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21))),
                ),
                Container(
                  height: 240,
                  width: size.width * .4,
                  color: AppColors.blackColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Center(
                    child: Text(
                      "20% discount \n on  the Early \n Booking of \n this flight \n Don't miss  ",
                      style: AppText.bigBoldHeading
                          .copyWith(color: AppColors.whiteColor, fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 480,
            width: size.width * .4,
            child: Column(
              children: [
                Container(
                  height: 240,
                  width: size.width * .4,
                  decoration: const BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(21))),
                  child: Column(
                    children: [
                      Text(
                        'Discount \n for survey',
                        style: AppText.bigHeading
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Take the survey \n about our \n services and \n get discount',
                          style: AppText.mediumHeading
                              .copyWith(color: AppColors.whiteColor))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 230,
                  width: size.width * .4,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: const BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.all(Radius.circular(21))),
                  child: Column(
                    children: [
                      Text(
                        'Take love',
                        style: AppText.bigHeading
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Text(
                              '😍',
                              style:
                                  AppText.bigBoldHeading.copyWith(fontSize: 70),
                            ),
                            Text(
                              '🥰',
                              style: AppText.bigBoldHeading
                                  .copyWith(fontSize: 100),
                            ),
                            Text(
                              '😘',
                              style:
                                  AppText.bigBoldHeading.copyWith(fontSize: 70),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
