


import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesService
{
  static SharedPreferences? sharedPreferences;


  static initializeStorage() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

                              ///add email
  addEmailToPref(String? email) async
  {
    await sharedPreferences!.setString('email', email!);
  }

  getEmailFromPref()
  {
    String? fcm = sharedPreferences?.getString('email');
    return fcm;
  }

                               ///add password
  setPassword(String? password) async
  {

    sharedPreferences?.setString("password", password!);
  }

  String? getPassword()  {


    String? accessToken =sharedPreferences?.getString('password');

    return accessToken;
  }



}
