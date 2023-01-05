import 'package:flutter/material.dart';

import '../app_colors.dart';


class PasswordInputField extends StatefulWidget {
  String? hintText;
  void Function(String)? onFieldSubmitted;
  TextInputType textInputType;
  bool needBorder;
  TextEditingController controller;
  String? Function(String?)? validator;
  FocusNode? focusNode;

  PasswordInputField(
      {required this.textInputType,
        this.hintText,
        this.onFieldSubmitted,
        required this.needBorder,
        required this.controller,
        this.validator,
        this.focusNode,
        Key? key})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  var obscureText =true;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 360,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextFormField(
          textInputAction: TextInputAction.go,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          obscureText: obscureText,
          validator: widget.validator,
          // style: TextStyle(
          //   fontSize: 12.sp,
          //   fontWeight: FontWeight.w400,
          //   //color: const Color(0xff5F5F5F),
          //   fontFamily: AppStrings.montserrat,
          // ),
          cursorColor: AppColors.blackColor,
          // onChanged: (value) {
          //   // print('$value');
          // },
          controller: widget.controller,
          keyboardType: widget.textInputType,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 18.0),
            // prefixIcon: const Icon(Icons.remove_red_eye, color: AppColors.buttonColorBlack,),
            suffixIcon: GestureDetector(
                onTap: ()
                {
                  setState((){
                    obscureText = !obscureText;
                  });
                },
                child: obscureText ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: const Icon(Icons.visibility_off, color: AppColors.textFieldHintColor,),
                )
                    :                 const Icon(Icons.remove_red_eye, color: AppColors.textFieldHintColor,)),

            errorStyle: const TextStyle(height: 0),
            hintText: widget.hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textFieldHintColor,
            ),
          ),
        ),
      ),
    );
  }
}
