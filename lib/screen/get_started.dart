import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../widget/logo.dart';
import 'login_screen.dart';
import 'success_screen.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          logoWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 179, left: 39, right: 39),
            child: Image.asset('assets/images/im1.png'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 29, left: 39, right: 39),
            child: Text(
              'Be productive! \nOrganize your \n routine.',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 40),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: buttonColor,
          onPressed: () {
            final user = auth.currentUser;
            if (user != null) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (contex) => SuccesScreen()));
            } else {
              Navigator.pushNamed(context, LoginPage.routeName);
            }
          },
          child: Image.asset('assets/images/coolicon.png')),
    );
  }
}
