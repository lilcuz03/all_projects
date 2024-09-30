import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';
const  bool? isColor =  null;

class AppText {
  static const TextStyle bigHeading = TextStyle(fontSize: 27);
  static const TextStyle bigBoldHeading =
      TextStyle(fontSize: 27, fontWeight: FontWeight.bold);
  static const TextStyle mediumHeading = TextStyle(fontSize: 24);
  static const TextStyle mediumBoldHeading =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle smallHeading = TextStyle(fontSize: 20);
  static const TextStyle smallBoldHeading =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const TextStyle ticketText =
      TextStyle(fontSize: 18, color:isColor==null? Color.fromARGB(255, 73, 187, 222) :AppColors.whiteColor,);
}
