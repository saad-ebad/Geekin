import 'package:flutter/cupertino.dart';
import 'package:geekin_assesment/utils/text_style.dart';
import '../app_colors.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  IconData? icon;
  IconData? leadingIcon;
  CustomAppBar({required this.title , this.icon , this.leadingIcon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.appBarColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .01,),
              Icon(this.icon),
              SizedBox(width: MediaQuery.of(context).size.width * .01,),
              Text(this.title , style: TextStyling.appBarTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
