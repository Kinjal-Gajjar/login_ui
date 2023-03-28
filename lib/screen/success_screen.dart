import 'package:flutter/material.dart';
import 'package:login_ui/utils/const.dart';
import 'package:login_ui/widget/logo.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          logoWidget(),
          const SizedBox(
            height: 30,
          ),
          const Text('Your Registration Was Succesful',
              style: TextStyle(
                  fontFamily: 'BalooBhai',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor)),
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/image2.png'),
          const Spacer(
            flex: 1,
          ),
          const Text('We are email confirmation'),
          const Text(
            'Test@email.com',
            style: TextStyle(
                fontFamily: 'BalooBhai',
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
        ],
      ),
    );
  }
}
