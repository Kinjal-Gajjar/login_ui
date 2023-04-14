import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/get_started.dart';
import 'screen/login_screen.dart';
import 'screen/phonescreen.dart';
import 'screen/register.dart';
import 'utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}


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
        '/': (context) => const GetStarted(),
        LoginPage.routeName: (contex) => const LoginPage(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        PhoneScreen.routeName: (context) => const PhoneScreen(),
      },
    );
  }
}
