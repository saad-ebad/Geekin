
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekin_assesment/routes/routes_name.dart';
import 'package:geekin_assesment/screens/Auth/login.dart';
import 'package:geekin_assesment/screens/Auth/signup.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.register:
        return MaterialPageRoute(builder: (BuildContext context) =>  SignupScreen());


      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) =>  LoginScreen());



      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}