import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekin_assesment/screens/Auth/login.dart';
import 'package:geekin_assesment/screens/Auth/signup.dart';
import 'package:geekin_assesment/screens/Home/home.dart';
import 'package:provider/provider.dart';

import 'Provider/bottom_bar_provider.dart';
import 'Provider/get_article_provider.dart';
import 'Provider/get_books_provider.dart';
import 'Provider/tab_index.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(

    // DevicePreview(
    //    enabled: true,
    //    builder: (context) => MyApp(), // Wrap your app
    //  ));

      const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return // MultiProvider(
          // providers: [
          //
          // ],
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => UserBottomBarProvider()),
              ChangeNotifierProvider(create: (_) => GetIndex()),
              ChangeNotifierProvider(create: (_) => ArticleProvider()),
              ChangeNotifierProvider(create: (_) => BookProvider()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'First Method',
                // You can use the library anywhere in the app even in theme
                theme: ThemeData(
                  // primarySwatch: Colors.blue,
                  // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
                ),
                home: child,


            ),
          );
      },
      child:  LoginScreen(),
    );
  }
}


