import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors.dart';


class SearchField extends StatefulWidget {
  String? hintText;
  void Function(String)? onFieldSubmitted;
  TextInputType textInputType;
  int? maxLines;
  bool needBorder;
  TextEditingController controller;
  String? Function(String?)? validator;
  FocusNode? focusNode;
  bool? enabled;
  InputDecoration? myDecoration;

  void Function()? onTap;
  List<TextInputFormatter>? inputFormatters;
  void Function(String)? onChanged;



  SearchField({ this.onChanged , this.maxLines , this.onFieldSubmitted ,this.inputFormatters, this.enabled, this.myDecoration, required this.textInputType,this.hintText, required this.needBorder,required this.controller,this.validator, this.focusNode , this.onTap});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black12,

        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextFormField(

          onTap: widget.onTap,
          textInputAction: TextInputAction.go,
          enabled: widget.enabled,

          focusNode: widget.focusNode,
          validator:widget.validator ,
          inputFormatters: widget.inputFormatters,

          onFieldSubmitted: widget.onFieldSubmitted,
          // style: TextStyle(
          //   fontSize: 12.sp,
          //   fontWeight: FontWeight.w400,
          //   //color: const Color(0xff5F5F5F),
          //   fontFamily: AppStrings.montserrat,
          // ),
          cursorColor: AppColors.blackColor,
          onChanged: widget.onChanged,
          controller: widget.controller,
          maxLines: widget.maxLines,
          keyboardType: widget.textInputType,
          textAlign: TextAlign.start,
          // inputFormatters: [
          //   FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
          // ],
          decoration: widget.myDecoration /*InputDecoration(
            contentPadding: EdgeInsets.only(top: 13.0),
            errorStyle: const TextStyle(

            ),
            suffixIcon: Icon(Icons.search),
            hintText: widget.hintText,

            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textFieldHintColor,
              fontFamily: AppStrings.openSemsSemiBold,
            ),
          )*/,
        ),
      ),
    );
  }
}