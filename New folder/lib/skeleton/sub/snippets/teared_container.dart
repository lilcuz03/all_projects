import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';

class TearedContainer extends StatelessWidget {
  const TearedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 20,
      width: size.width * .87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
                color: AppColors.appBg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
                color: AppColors.appBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
          ),
        ],
      ),
    );
  }
}
