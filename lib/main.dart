import 'package:flutter/material.dart';
import 'package:login_ui/screen/get_started.dart';
import 'package:login_ui/screen/phonescreen.dart';
import 'package:login_ui/screen/register.dart';
import 'package:login_ui/utils/const.dart';

import 'screen/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // home: GetStarted(),
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: primarycolor
      ),
      routes: {
        '/':(context) =>GetStarted(),
        LoginPage.routeName:(contex)=>LoginPage(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        PhoneScreen.routeName:(context) => PhoneScreen(),
      },
    );
  }
}
