import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resource/app_colors.dart';

class TextStyling {
  static TextStyle appBarTextStyle = TextStyle(
      fontSize: 20.sp,
      color: AppColors.appTextColor);
  static  TextStyle logoTitleTs = TextStyle(
      fontSize: 24.sp,
      color: AppColors.blackColor);
  static  TextStyle fieldTitleTs = TextStyle(
      fontSize: 14.sp,
      color: AppColors.appTextColor,
  );
  static  TextStyle blackSixteenTextStyle = TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
  );
  static  TextStyle blackTwentyTwoTextStyleBold = TextStyle(
      fontSize: 22.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700
  );
  static  TextStyle blackTwentyTextStyleBold = TextStyle(
      fontSize: 18.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700
  );
  static  TextStyle blackTwentyTwo = TextStyle(
      fontSize: 22.sp,
      color: AppColors.blackColor,
  );
  static  TextStyle buttonTextStyle = TextStyle(
      fontSize: 16.sp,
      color: AppColors.whiteTextColor,
  );
}