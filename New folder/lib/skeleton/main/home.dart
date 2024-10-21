import 'package:flutter/material.dart';
import 'package:new_project/json/flights.dart';
import 'package:new_project/json/hotels.dart';
import 'package:new_project/media/media.dart';
import 'package:new_project/skeleton/sub/reusable/double_text.dart';
import 'package:new_project/skeleton/sub/reusable/search_tab.dart';
import 'package:new_project/skeleton/sub/reusable/ticket.dart';
import 'package:new_project/skeleton/sub/sub-main/hotels.dart';
import 'package:new_project/styles/colors.dart';
import 'package:new_project/styles/text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBg,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'good Morning!',
                    style:
                        AppText.bigHeading.copyWith(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Book Tickets',
                      style: AppText.bigBoldHeading
                          .copyWith(color: AppColors.greyColor)),
                ],
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(Media.planeLogo))),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const SearchTab(),
          const SizedBox(
            height: 30,
          ),
          DoubleText(
              bigtext: 'UpComing Flights',
              smalltext: 'view all',
              funck: () => Navigator.pushNamed(context, 'tickets')),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: flights
                  .map((singleTicket) => Ticket(ticket: singleTicket))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DoubleText(bigtext: 'Hotels', smalltext: 'view all', funck: ()=> Navigator.pushNamed(context, 'hotels')),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: hotels
                      .map((singlehotel) => Hotels(hotel: singlehotel))
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
