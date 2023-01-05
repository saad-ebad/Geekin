
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/text_style.dart';
import '../app_colors.dart';

class CustomButton extends StatelessWidget {
  Color color;
  String text;
  final bool loading;


  CustomButton({required this.color , required this.text , this.loading=false});

  @override
  Widget build(BuildContext context) {
    num height = MediaQuery.of(context).size.height;
    num width = MediaQuery.of(context).size.width;
    return Container(
      width: width*1,
      height: height*.07,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(35)),


      ),
      child: Center(child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(text,style: TextStyling.buttonTextStyle,)),
    );
  }
}