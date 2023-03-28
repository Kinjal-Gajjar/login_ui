import 'package:flutter/material.dart';
import 'package:login_ui/utils/const.dart';
import 'package:login_ui/widget/logo.dart';

class LoginPage extends StatefulWidget {
  static var routeName = 'login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          logoWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 59, right: 60),
            child: Image.asset('assets/images/im1.png'),
          ),
          const SizedBox(
            height: 37,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(39)),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text('E-mail'),
                        TextField()
                      ],
                    )
                  ],
                ),
          )
        ],
      ),
    );
  }
}
