import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:new_project/styles/colors.dart';

class AppIcons {
  static const Icon homeIcon = Icon(
    FluentIcons.home_24_regular,
    color: AppColors.unActiveIcon,
  );
  static const Icon homeFilledIcon = Icon(
    FluentIcons.home_24_filled,
    color: AppColors.activeIcon,
  );
  static const Icon profileIcon = Icon(
    FluentIcons.person_24_regular,
    color: AppColors.unActiveIcon,
  );
  static const Icon profileFilledIcon = Icon(
    FluentIcons.person_24_regular,
    color: AppColors.activeIcon,
  );
  static const Icon ticketIcon = Icon(
    FluentIcons.ticket_horizontal_24_regular,
    color: AppColors.unActiveIcon,
  );
  static const Icon ticketFilledIcon = Icon(
    FluentIcons.ticket_horizontal_24_filled,
    color: AppColors.activeIcon,
  );
  static const Icon searchIcon = Icon(
    FluentIcons.search_24_regular,
    color: AppColors.unActiveIcon,
  );
  static const Icon searchFilledIcon = Icon(
    FluentIcons.search_24_filled,
    color: AppColors.activeIcon,
  );
  static const Icon flightTakeOffIcon = Icon(
    FluentIcons.airplane_take_off_24_regular,
    color: AppColors.unActiveIcon,
    size: 34,
  );
  static const Icon flightTakeOffIcon01 = Icon(
    FluentIcons.airplane_take_off_24_filled,
    color: AppColors.activeIcon,
    size: 34,
  );
  static const Icon flightLandingIcon = Icon(
    FluentIcons.airplane_landing_24_regular,
    color: AppColors.unActiveIcon,
    size: 34,
  );
  static const Icon flightSearchIcon = Icon(
    FluentIcons.search_24_regular,
    color: AppColors.unActiveIcon,
    size: 34,
  );
}
