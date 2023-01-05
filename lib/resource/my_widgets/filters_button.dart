

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class FilterButton extends StatelessWidget {
  LinearGradient color;
  String text;

  FilterButton({required this.color , required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 55.h,
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),


      ),
      child: Center(child: Text(text,style: TextStyle(fontSize: 20.sp, color: AppColors.whiteTextColor, fontWeight: FontWeight.w700),)),
    );
  }
}
