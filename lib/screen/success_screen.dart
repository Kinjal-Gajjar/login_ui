import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../widget/button.dart';
import '../widget/logo.dart';
import 'login_screen.dart';
import 'note.dart';

class SuccesScreen extends StatefulWidget {
  const SuccesScreen({super.key});

  @override
  State<SuccesScreen> createState() => _SuccesScreenState();
}

class _SuccesScreenState extends State<SuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logoWidget(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Your Registration Was Succesful',
                style: TextStyle(
                    fontFamily: 'BalooBhai',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/image2.png'),
          SizedBox(
            height: 20,
          ),
          const Text('We are email confirmation'),
          const Text(
            'Test@email.com',
            style: TextStyle(
                fontFamily: 'BalooBhai',
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
          Button(
            buttonName: 'LogOut',
            onpress: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure for logout?."),
                    actions: [
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) =>
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginPage.routeName));
                        },
                      ),
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              });

              // FirebaseAuth.instance.signOut().then(
              //     (value) => Navigator.pushNamed(context, LoginPage.routeName));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (contex) => NotePage()));
        },
        label: Text('Add Data'),
        backgroundColor: buttonColor,
      ),
    );
  }
}
