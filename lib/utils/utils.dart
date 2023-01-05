
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils
{


                                                ///Flutter Toast

  // static toastMessage(String message){
  //   Fluttertoast.showToast(
  //     msg: message,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //
  //   );
  // }

                                               ///Flush Bar

  // static void flushBarErrorMessage(String message, BuildContext context){
  //
  //   showFlushbar(context: context,
  //     flushbar: Flushbar(
  //       forwardAnimationCurve:Curves.decelerate,
  //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       padding: EdgeInsets.all(15),
  //       message: message,
  //       duration: Duration(seconds: 3),
  //       borderRadius: BorderRadius.circular(8),
  //       flushbarPosition: FlushbarPosition.TOP,
  //       backgroundColor: Colors.red,
  //       reverseAnimationCurve: Curves.easeInOut,
  //       positionOffset: 20,
  //       icon: Icon(Icons.error , size: 28 , color: Colors.white,),
  //     )..show(context),
  //
  //   );
  //
  // }

                                                 ///Snack Bar

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(message ))
    );
  }

 static EdgeInsetsGeometry paddingTwelve = const EdgeInsets.only(left: 12 , right: 12);

  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,

    );
  }


  static bool validateEmail(String? value) {
    String? _msg;
    bool? condition;
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty && value == null) {
      return condition = false;
    }
    if (!regex.hasMatch(value)) {
      return condition = false;
    } else {
      return condition = true;
    }
  }


}
class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 12.h,);
  }
}

class CustomSizedBoxDrawer extends StatelessWidget {
  const CustomSizedBoxDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 3.h,);
  }
}