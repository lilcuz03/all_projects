import 'package:flutter/material.dart';
import 'package:new_project/json/hotels.dart';
import 'package:new_project/skeleton/sub/sub-main/hotels.dart';
import 'package:new_project/styles/colors.dart';

class Hotel extends StatelessWidget {
  const Hotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.appBg,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: hotels
                .map((singleHotel) => Hotels(hotel: singleHotel))
                .toList(),
          ),
        ),
      ),
    );
  }
}
